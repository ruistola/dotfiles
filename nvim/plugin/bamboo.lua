local bamboo = require("bamboo")

bamboo.setup({
  style = "vulgaris",
  toggle_style_key = nil,
  transparent = false,
  dim_inactive = false,
  term_colors = true,
  ending_tildes = false,
  cmp_itemkind_reverse = false,
  code_style = {
    comments = { italic = true },
    conditionals = { italic = true },
    keywords = {},
    functions = {},
    namespaces = { italic = true },
    parameters = { italic = true },
    strings = {},
    variables = {},
  },
  diagnostics = {
    darker = true, -- darker colors for diagnostic
    undercurl = true, -- use undercurl instead of underline for diagnostics
    background = true, -- use background color for virtual text
  },
})
