return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        enabled = true,
        config = function()
            require("which-key").setup({})
            require("config.keymap")
        end,
    },
}
