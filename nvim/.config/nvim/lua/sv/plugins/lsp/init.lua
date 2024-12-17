return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",

        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",

        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",

        -- Helm-ls
        {
            "towolf/vim-helm",
            ft = "helm"
        }
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "gopls",
                "rust_analyzer",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {}
                end,
                ["terraformls"] = function()
                    local lspconfig = require "lspconfig"
                    lspconfig.terraformls.setup {}
                    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
                        pattern = { "*.tf", "*.tfvars" },
                        callback = function()
                            vim.lsp.buf.format()
                        end,
                    })
                end,
                ["pyright"] = function()
                    local lspconfig = require "lspconfig"
                    lspconfig.pyright.setup {
                        settings = {
                            pyright = {
                                -- Using Ruff's import organizer
                                disableOrganizeImports = true,
                            },
                            python = {
                                analysis = {
                                    -- Ignore all files for analysis to exclusively use Ruff for linting
                                    ignore = { '*' },
                                },
                            },
                        },
                    }
                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        settings = {
                            Lua = {
                                runtime = {
                                    version = 'Lua 5.1',
                                    path = {
                                        '?.lua',
                                        '?/init.lua',
                                        vim.fn.expand '~/.luarocks/share/lua/5.1/?.lua',
                                        vim.fn.expand '~/.luarocks/share/lua/5.1/?/init.lua',
                                        '/usr/share/5.1/?.lua',
                                        '/usr/share/lua/5.1/?/init.lua'
                                    }
                                },
                                --  workspace = {
                                --      library = {
                                --          vim.fn.expand '~/.luarocks/share/lua/5.1',
                                --          '/usr/share/lua/5.1'
                                --      }
                                -- },
                                diagnostics = {
                                    globals = { "vim", "kong" }
                                }
                            }
                        }
                    }
                end,
                ["helm_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.helm_ls.setup {
                        settings = {
                            ["helm_ls"] = {
                                valuesFiles = {
                                    mainValuesFile = "values.yaml",
                                    additionalValuesFilesGlobPattern = "values.*.yaml",
                                },
                                yamlls = {
                                    enabled = true,
                                    path = "yaml-language-server",
                                    config = {
                                        validate = true,
                                        schemaStore = {
                                            enable = true,
                                            url = "https://www.schemastore.org/json",
                                        },
                                        schemas = {
                                            ["https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json"] = {
                                                "argocd_app-*.yaml",
                                                "argocd_app-*.yml",
                                            }
                                        },
                                    }
                                }
                            }
                        }
                    }
                end,
                ["yamlls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.yamlls.setup {
                        settings = {
                            yaml = {
                                validate = true,
                                schemaStore = {
                                    enable = true,
                                    url = "https://www.schemastore.org/json",
                                },
                                schemas = {
                                    ["https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json"] = {
                                        "argocd_app-*.yaml",
                                        "argocd_app-*.yml",
                                    }
                                },
                            }
                        }
                    }
                end,
                ["jinja_lsp"] = function()
                    vim.filetype.add {
                        extension = {
                            jinja = 'jinja',
                            jinja2 = 'jinja',
                            j2 = 'jinja',
                        },
                    }
                    local lspconfig = require("lspconfig")
                    lspconfig.jinja_lsp.setup {}
                end
            }
        })
        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
                { name = 'path' },
            }, {
                { name = 'buffer' },
            }
            )
        })

        -- Snippets sourcing
        require("luasnip.loaders.from_snipmate").lazy_load({ paths = "~/.config/nvim/lua/sv/plugins/snippets" })
        local ls = require("luasnip")
        vim.keymap.set({ "s" }, "<Tab>", function() ls.jump(1) end, { silent = true })
    end
}
