return {
  {
    "nvim-cmp",
    opts = function(_, opts)
      table.insert(opts.sorting.comparators, 1, require("clangd_extensions.cmp_scores"))
      local cmp = require("cmp")
      opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
        ["<C-Z>"] = cmp.mapping.confirm({ select = true }),
        ["<CR>"] = cmp.config.disable,
      })
    end,
  },
}
