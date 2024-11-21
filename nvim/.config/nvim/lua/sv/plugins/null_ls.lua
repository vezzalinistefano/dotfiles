return {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "nvimtools/none-ls.nvim",
    },
    config = function()
        require("mason-null-ls").setup({
            ensure_installed = { "black", "jq", "prettier", "ruff" },
            automatic_installation = false
        })

        local none_ls = require "null-ls"

        none_ls.setup({
            sources = {
                none_ls.builtins.formatting.black,
            }
        })
    end,
}
