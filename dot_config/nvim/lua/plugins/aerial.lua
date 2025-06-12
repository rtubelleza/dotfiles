-- lazy.nvim style
return {
    "stevearc/aerial.nvim",
    opts = {
        backends = { "markdown", "lsp", "treesitter" },
        layout = {
            min_width = 30,
            default_direction = "prefer_right",
        },
        close_on_select = true,
        autojump = true,
        lazy_load = true,
        filter_kind = false,
        manage_folders = false,
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
        { "<leader>mn", "<cmd>AerialToggle<CR>", desc = "Toggle Aerial outline" },
    },
}
