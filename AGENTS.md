# LazyVim Neovim Config

Based on [LazyVim](https://github.com/LazyVim/LazyVim). Plugin manager: lazy.nvim (installed on first run).

## Key plugins

- Theme: catppuccin (mocha flavor, transparent background)
- Editor: blink.cmp, nvim-cmp with tailwindcss-colorizer-cmp
- UI: noice.nvim, snacks.nvim, lualine.nvim, bufferline.nvim
- LSP: nvim-lspconfig, mason.nvim
- Flutter: flutter-tools.nvim, venv-selector.nvim

## Code style

- stylua.toml: 2-space indent, 120-column width
- Format on save via conform.nvim (prettier for JS/TS)
- No comments unless requested

## Important quirks

- **Font management**: init.lua auto-resizes fonts on VimEnter/VimLeave (CSI SetFontSize escape sequences)
- **Auto-save**: enabled on InsertLeave and TextChanged events (lua/config/options.lua:13)
- **Neo-tree disabled**: neo-tree.nvim is disabled; nvim-tree.lua is used instead
- **Cursor blink**: block cursor blinks on500/off500
- **Escape mapping**: `jk` in insert mode; `<Esc>` in normal mode clears search highlights
- **Diagnostic float**: focusable=true, wrap=true for long error strings

## Adding plugins

Edit `lua/plugins/` with a new `xxx.lua` file, or add to an existing plugin spec file. Plugins are loaded via lazy.nvim spec in `lua/config/lazy.lua`. Run `:Lazy` to reload.

## Lockfile

`lazy-lock.json` tracks exact commits. Run `:Lazy sync` to update.