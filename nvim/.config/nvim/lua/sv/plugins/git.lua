return {

    -- Git client
    {
        'tpope/vim-fugitive',
        keys = {
            { '<leader>gs', vim.cmd.Git, desc = "Vim Fugitive" },
        },
    },

}
