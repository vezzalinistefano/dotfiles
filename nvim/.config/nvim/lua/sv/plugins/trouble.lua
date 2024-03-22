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

        local trouble = require("trouble")
        local map = vim.keymap.set

        map("n", "<leader>tt", function() trouble.toggle() end)

        map("n", "[d", function() trouble.next({ skip_groups = true, jump = true }) end)
        map("n", "]d", function() trouble.previous({ skip_groups = true, jump = true }) end)

        map("n", "<leader>ca", function() trouble.toggle("quickfix") end)
    end
}
