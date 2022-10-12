--require('nvim-tree').setup(
--	{
--		view = {
--			adaptive_size = true
--		}
--	})
--
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

--vim.g.nvim_tree_icons. = {
--	git = {
--		  unstaged = "✗",
--		  staged = "✓",
--		  unmerged = "",
--		  renamed = "➜",
--		  untracked = "★",
--		  deleted = "",
--		  ignored = "◌",
--		}
--}

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
	full_name = true,
	icons = {
        git_placement = "signcolumn",
        show = {
          file = true,
          folder = false,
          folder_arrow = false,
          git = true,
        },
		glyphs = {
			git = {
			  unstaged = "✗",
			  staged = "✓",
			  unmerged = "",
			  renamed = "➜",
			  untracked = "★",
			  deleted = "",
			  ignored = "◌",
			}
		}
	}
  },
  filters = {
    dotfiles = true,
  },
})
