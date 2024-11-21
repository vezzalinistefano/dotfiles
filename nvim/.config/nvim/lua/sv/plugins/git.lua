return {

    -- Git client
    {
        'tpope/vim-fugitive',
    },

    {
        'sindrets/diffview.nvim'
    },

    {
        "rbong/vim-flog",
        lazy = true,
        cmd = { "Flog", "Flogsplit", "Floggit" },
        dependencies = {
            "tpope/vim-fugitive",
        },
    },

}
