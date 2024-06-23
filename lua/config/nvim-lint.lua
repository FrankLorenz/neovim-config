local lint = require("lint")

lint.linters_by_ft = {
  cmake = { "cmakelint" },
  cpp = { "cpplintiii" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})

vim.keymap.set("n", "<leader>cB", function()
  lint.try_lint()
end, { desc = "Trigger linitng for current file" })
