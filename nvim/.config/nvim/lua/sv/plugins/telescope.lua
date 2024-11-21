return {

    -- Fuzzy finder
    "nvim-telescope/telescope.nvim",

    tag = "0.1.6",

    dependencies = {
        'nvim-lua/plenary.nvim',
        'ANGkeith/telescope-terraform-doc.nvim',
        'nvim-telescope/telescope.nvim',
    },

    config = function()
        require("telescope").setup({})

        require('telescope').load_extension('terraform_doc')
        -- require('telescope').load_extension('terraform')

        local builtin = require('telescope.builtin')
        vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
        vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
        vim.keymap.set("n", "<C-p>", builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end

}
