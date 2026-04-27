return {
  -- 1. Move the File Explorer to the RIGHT
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "right",
        width = 30,
      },
      filesystem = {
        group_empty_dirs = true, -- Compact folders like your VS Code setting
      },
    },
  },

  -- 2. HIDE THE TABS (Bufferline)
  -- Zed feels clean because it doesn't have bulky tabs.
  { "akinsho/bufferline.nvim", enabled = false },

  -- 3. THEME: One Dark Pro
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },

  -- 4. MINIMAL STATUSLINE
  -- Hiding activity bars and layout controls
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.component_separators = ""
      opts.options.section_separators = ""
      -- Removing the activity bar feel by making it thin
      opts.sections.lualine_a = { "mode" }
      opts.sections.lualine_z = { "location" }
    end,
  },
}
