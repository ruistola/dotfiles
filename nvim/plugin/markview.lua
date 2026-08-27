-- markview.nvim — hackable in-buffer Markdown / LaTeX / Typst previewer.
--
-- Registration lives in the central list in init.lua; this file owns only the
-- configuration. Delete this file to drop back to markview's defaults (or
-- remove the init.lua entry too to uninstall entirely).
-- Relies on the bundled `markdown` + `markdown_inline` treesitter parsers,
-- which ship with Neovim, so no extra dependencies are needed.

require("markview").setup({
  preview = {
    -- "internal" keeps this dependency-free. Switch to "devicons" (you already
    -- have nvim-web-devicons) or "mini" if you prefer their icons.
    icon_provider = "internal",

    -- Filetypes markview attaches to. "markdown" covers the opencode-buffer.nvim
    -- chat buffers, which are filetype=markdown by default. Append any custom
    -- filetype here if you ever change that plugin's `filetype` option.
    filetypes = { "markdown", "quarto", "rmd", "typst", "asciidoc" },

    -- Hybrid mode: reveal the raw source of the node under the cursor while
    -- everything else stays rendered. Great for editing without toggling off.
    hybrid_modes = { "n" },
  },
})
