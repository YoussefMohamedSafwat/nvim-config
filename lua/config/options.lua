-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 8 -- Keep 8 lines above/below cursor
opt.colorcolumn = "80,120" -- Your VS Code rulers
opt.laststatus = 3 -- Global statusline (cleaner look)
opt.cursorline = true -- Highlight current line
vim.g.lazyvim_colorscheme = "catppuccin"
-- Auto-save logic (mimicking VS Code's afterDelay)
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  callback = function()
    if vim.bo.modified then
      vim.cmd("silent! wall")
    end
  end,
})
vim.opt.guicursor =
  "n-v-c:block-blinkon500-blinkoff500,i-ci-ve:ver25-blinkon500-blinkoff500,r-cr:hor20-blinkon500-blinkoff500"
vim.diagnostic.config({
  float = {
    border = "rounded",
    -- This is the crucial part:
    focusable = true, -- Allow you to tab into the window to scroll it
    width = 60, -- Give it a fixed width
    wrap = true, -- Wrap the long Flutter error strings
  },
})
