-- markview.nvim — hackable in-buffer Markdown / LaTeX / Typst previewer.
--
-- Self-contained plugin file: registration (vim.pack) AND configuration both
-- live here. Delete this single file to remove the plugin and all its config.
-- Requires the bundled `markdown` + `markdown_inline` treesitter parsers,
-- which ship with Neovim, so no extra dependencies are needed.

vim.pack.add({
  "https://github.com/OXY2DEV/markview.nvim",
})

require("markview").setup({
  preview = {
    -- "internal" keeps this file dependency-free. Switch to "devicons" (you
    -- already have nvim-web-devicons) or "mini" if you prefer their icons.
    icon_provider = "internal",

    -- Filetypes markview attaches to. Add your AI plugin's buffer filetype
    -- here to get rendered Markdown inside it, e.g. append "codecompanion".
    filetypes = { "markdown", "quarto", "rmd", "typst", "asciidoc" },

    -- Hybrid mode: reveal the raw source of the node under the cursor while
    -- everything else stays rendered. Great for editing without toggling off.
    hybrid_modes = { "n" },
  },
})
