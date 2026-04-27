return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-mini/mini.icons" },
    config = function()
      require("mini.icons").setup()
      require("mini.icons").mock_nvim_web_devicons()
      local ns = vim.api.nvim_create_namespace("nvim_tree_folder_colors")

      local function apply_folder_colors(bufnr)
        if not vim.api.nvim_buf_is_valid(bufnr) then
          return
        end
        vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

        local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
        for i, line_text in ipairs(lines) do
          -- BULLETPROOF CHECK: Read the UI visually instead of calling broken APIs
          -- If the line contains a folder arrow or the empty folder glyph, it's a directory
          local is_folder = line_text:find("") or line_text:find("") or line_text:find("󰜌")

          if is_folder then
            -- Extract the folder name (the first actual word after the symbols)
            local folder_name = line_text:match("([%w_%-]+)")

            if folder_name then
              local icon, hl = require("mini.icons").get("directory", folder_name:lower())
              local text_start = line_text:find(folder_name, 1, true)

              if text_start then
                local icon_col = text_start - 3

                -- Color the folder text
                vim.api.nvim_buf_set_extmark(bufnr, ns, i - 1, text_start - 1, {
                  end_row = i - 1,
                  end_col = #line_text,
                  hl_group = hl,
                  priority = 200,
                })

                -- Overlay the colorful icon
                vim.api.nvim_buf_set_extmark(bufnr, ns, i - 1, icon_col, {
                  virt_text = { { icon, hl } },
                  virt_text_pos = "overlay",
                  priority = 300,
                })
              end
            end
          end
        end
      end

      require("nvim-tree").setup({
        view = { side = "right", width = 35 },
        renderer = {
          highlight_git = "none",
          indent_markers = { enable = true },
          icons = {
            show = { git = true, file = true, folder = true, folder_arrow = true },
            glyphs = {
              -- The official, stable schema for folder arrows
              folder = {
                arrow_closed = "",
                arrow_open = "",
                default = "󰜌",
                open = "󰜌",
                empty = "󰜌",
                empty_open = "󰜌",
              },
              git = {
                unstaged = "●",
                staged = "✓",
                untracked = "★",
                ignored = "◌",
              },
            },
          },
        },
      })

      -- Subscribe to the render event
      local api = require("nvim-tree.api")
      api.events.subscribe(api.events.Event.TreeRendered, function(data)
        apply_folder_colors(data.bufnr)
      end)

      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
    end,
  },
}
