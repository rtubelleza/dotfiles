return {
	{
		"benlubas/molten-nvim",
		dev = false,
		enabled = true,
		version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
		build = ":UpdateRemotePlugins",
		dependencies = { "willothy/wezterm.nvim" },
		init = function()
			vim.g.molten_image_provider = "wezterm"
			-- vim.g.molten_output_win_max_height = 20
			vim.g.molten_auto_open_output = false
			vim.g.molten_auto_open_html_in_browser = true
			vim.g.molten_tick_rate = 200
			vim.g.molten_split_direction = "right"
			vim.g.molten_split_size = 50
		end,
		config = function()
			local init = function()
				local quarto_cfg = require("quarto.config").config
				quarto_cfg.codeRunner.default_method = "molten"
				vim.cmd([[MoltenInit]])
			end
			local deinit = function()
				local quarto_cfg = require("quarto.config").config
				quarto_cfg.codeRunner.default_method = "slime"
				vim.cmd([[MoltenDeinit]])
			end
			vim.keymap.set("n", "<localleader>mi", init, { silent = true, desc = "Initialize molten" })
			vim.keymap.set("n", "<localleader>md", deinit, { silent = true, desc = "Stop molten" })
			vim.keymap.set(
				"n",
				"<localleader>mp",
				":MoltenImagePopup<CR>",
				{ silent = true, desc = "molten image popup" }
			)
			vim.keymap.set(
				"n",
				"<localleader>mb",
				":MoltenOpenInBrowser<CR>",
				{ silent = true, desc = "molten open in browser" }
			)
			vim.keymap.set("n", "<localleader>mh", ":MoltenHideOutput<CR>", { silent = true, desc = "hide output" })
			vim.keymap.set(
				"n",
				"<localleader>ms",
				":noautocmd MoltenEnterOutput<CR>",
				{ silent = true, desc = "show/enter output" }
			)
		end,
	},
}
