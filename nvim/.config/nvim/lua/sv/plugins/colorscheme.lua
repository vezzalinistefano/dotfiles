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

{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			term_colors = true,
			transparent_background = false,
			styles = {
				comments = {},
				conditionals = {},
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
			},
			color_overrides = {
				mocha = {
					base = "#000000",
					mantle = "#000000",
					crust = "#000000",
				},
			},
			integrations = {
				telescope = {
					enabled = true,
					style = "nvchad",
				},
				dropbar = {
					enabled = true,
					color_mode = true,
				},
			},
		},
        config = function(_, opts)
            require("catppuccin").setup(opts)
            -- vim.cmd.colorscheme("catppuccin-mocha")
        end
	},

    {
        "EdenEast/nightfox.nvim" ,
        priority=1000,
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("carbonfox")
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
        "sainnhe/gruvbox-material",
        priority = 1000,
        opts = ...,
        config = function(_, opts)
            vim.o.background = "dark" -- or "light" for light mode
            -- Colorize("gruvbox")
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function(_, opts)
            -- Colorize("gruvbox")
        end,
        opts = ...
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

            -- Colorize("rose-pine")
        end
    }
}
