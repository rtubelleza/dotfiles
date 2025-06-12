return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local lualine = require("lualine")
            lualine.setup({
                options = { theme = "nightfly", globalstatus = true },
                tabline = {
                    lualine_a = { "mode" },
                    lualine_b = { "buffers" },
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
                sections = {},
            })
        end,
    },
}
