function Colorize(color)
    color = color or "kanagawa"

    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

end

return {

    -- TokyoNight
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        },
        config = function(_, opts)
            require("tokyonight").setup(opts)
            -- Colorize("tokyonight-night")
        end
    },

    -- Kanagawa
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        -- opts = { theme = "dragon" },
        config = function(_, opts)
            require("kanagawa").setup(opts)

            -- Colorize("kanagawa")
        end
    },

    -- Gruvbox
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        opts = ...,
        config = function()
            -- Colorize("gruvbox")
        end
    },

    -- Rose Pine
    {
        "rose-pine/neovim",
        name = "rose-pine",
        opts = {
            variant = "main",
            disable_background = true
        },
        config = function(_, opts)
            require("rose-pine").setup(opts)

            Colorize("rose-pine")
        end
    }

}
