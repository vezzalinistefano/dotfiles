return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    config = function()
        require("trouble").setup({})

        local map = vim.keymap.set

        map("n", "<leader>tt", function() require("trouble").toggle("workspace_diagnostics") end)

        map("n", "[d", function() require("trouble").next({ skip_groups = true, jump = true }) end)
        map("n", "]d", function() require("trouble").previous({ skip_groups = true, jump = true }) end)
    end
}
