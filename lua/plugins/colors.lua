return {
  -- 1. Highlight colors in the buffer (the code lines)
  {
    "brenoprata10/nvim-highlight-colors",
    opts = {
      render = "virtual", -- or 'foreground' or 'virtual'
      virtual_symbol = "■", -- This puts a small square at the end of the line
      enable_named_colors = true,
      enable_tailwind = true,
    },
  },

  -- 2. Add color squares to the auto-complete menu (for Tailwind/CSS)
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- this sub-plugin ensures the color square shows up in your code suggestions
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end,
  },
}
