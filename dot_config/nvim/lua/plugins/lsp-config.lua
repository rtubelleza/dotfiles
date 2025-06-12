return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            -- Lua
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })

            -- Python
            lspconfig.pyright.setup({
                filetypes = { "python" },
                capabilities = capabilities,
            })

            lspconfig.ruff.setup({
                capabilities = capabilities,
            })

            -- Keymaps
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

            -- Default diagnostics
            vim.diagnostic.config({
                virtual_text = true, -- Enable inline messages
                signs = true, -- Enable gutter signs like H, E, W, etc.
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })
        end,
    },
    {
        "jmbuhr/otter.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "neovim/nvim-lspconfig",
        },
        opts = {},
    },
}
