local M = {
  "jedrzejboczar/possession.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
}

M.config = function()
  local possession = require("possession")
  local Path = require("plenary.path")
  possession.setup({

    session_dir = (Path:new(vim.fn.stdpath("data")) / "possession"):absolute(),
    silent = false,
    load_silent = true,
    debug = false,
    logfile = false,
    prompt_no_cr = false,
    autosave = {
      current = true, -- or fun(name): boolean
      tmp = false, -- or fun(): boolean
      tmp_name = "tmp", -- or fun(): string
      on_load = true,
      on_quit = true,
    },
    commands = {
      save = "PossessionSave",
      load = "PossessionLoad",
      rename = "PossessionRename",
      close = "PossessionClose",
      delete = "PossessionDelete",
      show = "PossessionShow",
      list = "PossessionList",
      migrate = "PossessionMigrate",
    },
    hooks = {
      before_save = function()
        return {}
      end,
      after_save = function(name, user_data, aborted) end,
      before_load = function(name, user_data)
        return user_data
      end,
      after_load = function(name, user_data) end,
    },
    plugins = {
      close_windows = {
        hooks = { "before_save", "before_load" },
        preserve_layout = true, -- or fun(win): boolean
        match = {
          floating = true,
          buftype = {},
          filetype = {},
          custom = false, -- or fun(win): boolean
        },
      },
      delete_hidden_buffers = {
        hooks = {
          "before_load",
          vim.o.sessionoptions:match("buffer") and "before_save",
        },
        force = false, -- or fun(buf): boolean      delete_hidden_buffers = false,
      },
    },
    telescope = {
      previewer = {
        enabled = true,
        previewer = "pretty", -- or 'raw' or fun(opts): Previewer
        wrap_lines = true,
        include_empty_plugin_data = false,
        cwd_colors = {
          cwd = "Comment",
          tab_cwd = { "#cc241d", "#b16286", "#d79921", "#689d6a", "#d65d0e", "#458588" },
        },
      },
      list = {
        default_action = "load",
        mappings = {
          save = { n = "<c-x>", i = "<c-x>" },
          load = { n = "<c-v>", i = "<c-v>" },
          delete = { n = "<c-t>", i = "<c-t>" },
          rename = { n = "<c-r>", i = "<c-r>" },
        },
      },
    },
  })
end

M.session_save_new = function()
  vim.ui.input({ prompt = "Name of session:" }, function(input)
    if input == nil or input == "" then
      return
    end
    require("possession.session").save(input)
  end)
end

M.session_save = function()
  local session_name = require("possession.session").session_name
  if session_name == nil then
    vim.ui.input({ prompt = "Name of session:" }, function(input)
      if input == nil or input == "" then
        return
      end
      require("possession.session").save(input)
    end)
  else
    require("possession.session").save(session_name, { no_confirm = true })
  end
end

return M
