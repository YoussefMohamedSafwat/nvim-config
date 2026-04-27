-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- When entering Neovim, shrink the font to look "normal"
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Set this to your preferred "Coding" size
    io.write("\x1b]50;SetFontSize=18\x07")
  end,
})

-- When leaving Neovim, grow the font for the terminal shell
vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    -- Set this to your preferred "Shell" size
    io.write("\x1b]50;SetFontSize=12\x07")
  end,
})
