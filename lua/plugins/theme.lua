return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = true, -- Matches your Ghostty blur
      term_colors = true,
      integrations = {
        neotree = true,
        cmp = true,
        telescope = { enabled = true },
        mason = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = true,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        -- Specific fixes for your Flutter workflow
        lsp_trouble = true,
        which_key = true,
      },
    },
  },
}
