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
            -- limit the height of the hover window (for documentation)
            size = { max_width = 80, max_height = 20 },
          },
        },
      },
    },
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },
  -- active indent guide and indent text objects
  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        -- Disables animation
        -- animation = require("mini.indentscope").gen_animation.none(),
      },
    },
  },
}
