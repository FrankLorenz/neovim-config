-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

-- DO NOT USE THIS IN YOU OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = Util.safe_keymap_set

-- Copy selected text to system clipboard with Ctrl-C in visual mode
vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })

-- Paste from system clipboard with Ctrl-V in normal and visual mode
vim.keymap.set({'n', 'v'}, '<C-v>', '"+p', { noremap = true, silent = true })

--   Shift + Arrow keys to enter visual mode and expand selection
vim.keymap.set('n', '<S-Left>',  'v<Left>',  { noremap = true, silent = true })
vim.keymap.set('n', '<S-Right>', 'v<Right>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Up>',    'v<Up>',    { noremap = true, silent = true })
vim.keymap.set('n', '<S-Down>',  'v<Down>',  { noremap = true, silent = true })

vim.keymap.set('v', '<S-Left>',  '<Left>',   { noremap = true, silent = true })
vim.keymap.set('v', '<S-Right>', '<Right>',  { noremap = true, silent = true })
vim.keymap.set('v', '<S-Up>',    '<Up>',     { noremap = true, silent = true })
vim.keymap.set('v', '<S-Down>',  '<Down>',   { noremap = true, silent = true })

