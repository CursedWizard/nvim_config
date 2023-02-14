return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        hover = {
          enabled = true,
          view = nil, -- when nil, use defaults from documentation
          opts = {
            size = { max_width = 80, max_height = 20 },
          },
        },
      },
    },
  },
}
