-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Escape with jk
vim.keymap.set("i", "jk", "<Esc>", { desc = "Escape to Normal Mode" })

-- Clear search highlights with ESC (Zed-like behavior)
vim.keymap.set("n", "<Esc>", "<cmd>noh<cr><Esc>", { desc = "Escape and Clear hlsearch" })
