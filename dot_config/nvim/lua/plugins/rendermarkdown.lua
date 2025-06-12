return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {
      render_modes = true, -- enable render modes
      anti_conceal = {
        enabled = true,
        ignore = {
          code_background = true,
          sign = true,
          quota = true,
        },
      },
      file_types = { "markdown", "quarto", "codecompanion" },
      latex = { enabled = false },
    },
  },
}
