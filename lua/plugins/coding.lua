return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      -- Original formatting logic
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        -- Add the color square for Tailwind/CSS
        format_kinds(entry, item) -- keep default icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
}
