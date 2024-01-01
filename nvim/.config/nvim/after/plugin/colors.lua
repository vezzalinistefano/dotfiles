require('rose-pine').setup({
    disable_background = true
})

function Colorize(color)
    color = color or "rose-pine"

    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    -- vim.g.tokyonight_dark_float = false
end

----require("gruvbox").setup({
----  undercurl = true,
----  underline = true,
----  bold = true,
----  italic = {
----    strings = true,
----    comments = true,
----    operators = false,
----    folds = true,
----  },
----  strikethrough = true,
----  invert_selection = false,
----  invert_signs = false,
----  invert_tabline = false,
----  invert_intend_guides = false,
----  inverse = true, -- invert background for search, diffs, statuslines and errors
----  contrast = "", -- can be "hard", "soft" or empty string
----  palette_overrides = {},
----  overrides = {},
----  dim_inactive = false,
----  transparent_mode = false,
----})

Colorize()
