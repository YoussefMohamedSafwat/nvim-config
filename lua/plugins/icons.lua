return {
  {
    "nvim-mini/mini.icons",
    version = false, -- always use latest
    config = function()
      require("mini.icons").setup({
        -- Here you define custom icons + colors for specific folders
        -- mini.icons already has hundreds of built-in ones (android, lib, assets, etc.)
        -- We only override or add what we want different
        directory = {
          -- Flutter / Dart specific
          android = { glyph = "󰀲", hl = "MiniIconsGreen" },
          assets = { glyph = "󰈶", hl = "MiniIconsYellow" },
          lib = { glyph = "󰏗", hl = "MiniIconsBlue" },
          features = { glyph = "󰙕", hl = "MiniIconsPurple" },
          bloc = { glyph = "󰟵", hl = "MiniIconsBlue" },
          core = { glyph = "󰏗", hl = "MiniIconsCyan" },
          presentation = { glyph = "󰈙", hl = "MiniIconsPurple" },
          data = { glyph = "󰆼", hl = "MiniIconsOrange" },
          di = { glyph = "󰡱", hl = "MiniIconsOrange" },
          domain = { glyph = "󰉼", hl = "MiniIconsPurple" },
          controller = { glyph = "󰮄", hl = "MiniIconsRed" },
          cubit = { glyph = "󰆧", hl = "MiniIconsBlue" },
          -- Add more folders here as needed
        },
      })

      -- This makes other plugins (including nvim-tree) use mini.icons
      require("mini.icons").mock_nvim_web_devicons()
    end,
  },
}
