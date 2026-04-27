return {
  "nvim-neo-tree/neo-tree.nvim",
  -- This forces LazyVim to prioritize your settings over the defaults
  keys = {
    { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (Root Dir)", remap = true },
    { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
  },
  opts = function(_, opts)
    -- 1. Move to the Right
    opts.window = opts.window or {}
    opts.window.position = "right"
    opts.window.width = 30

    -- 2. Material-style Icons and Indents
    opts.default_component_configs = opts.default_component_configs or {}
    opts.default_component_configs.indent = {
      with_expanders = true,
      expander_collapsed = "",
      expander_expanded = "",
    }

    opts.default_component_configs.icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "󰜌",
      default = "󰈚",
    }

    -- 3. Filter out the "clutter" (like VS Code/Zed)
    opts.filesystem = opts.filesystem or {}
    opts.filesystem.filtered_items = {
      visible = false,
      hide_dotfiles = true,
      hide_gitignored = true,
      hide_by_name = {
        ".git",
        "node_modules",
        ".dart_tool", -- Specific for your Flutter work
      },
    }
  end,
}
