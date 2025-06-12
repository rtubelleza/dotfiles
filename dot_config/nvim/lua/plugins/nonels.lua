return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"jayp0521/mason-null-ls.nvim",
	},
	config = function()
		-- Automatic Installs
		local mason_null_ls = require("mason-null-ls")
		mason_null_ls.setup({
			ensure_installed = {
				"ruff",
				"prettier",
				"shfmt",
			},
			automatic_installation = true,
		})

		-- Configuration
		local null_ls = require("null-ls")
		local sources = {
			null_ls.builtins.formatting.stylua,
			--null_ls.builtins.diagnostics.eslint,
			--null_ls.builtins.completion.spell
			require("none-ls.formatting.ruff").with({ extra_args = { "--extend-select", "I" } }),
			require("none-ls.formatting.ruff_format"),
			null_ls.builtins.formatting.prettier.with({ filetypes = { "json", "yaml", "markdown" } }),
			null_ls.builtins.formatting.shfmt.with({ args = { "-i", "4" } }),
		}

		-- Automatically Format Files on Save
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			sources = sources,
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
