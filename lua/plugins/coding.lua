return {
  {
    "zbirenbaum/copilot.lua", -- AI programming
    event = "InsertEnter",
    init = function()
      require("legendary").keymaps({
        {
          itemgroup = "Copilot",
          description = "AI programming...",
          icon = "",
          keymaps = {
            {
              "<C-a>",
              function()
                require("copilot.suggestion").accept()
              end,
              description = "Accept suggestion",
              mode = { "i" },
              opts = { silent = true },
            },
            {
              "<C-x>",
              function()
                require("copilot.suggestion").dismiss()
              end,
              description = "Dismiss suggestion",
              mode = { "i" },
              opts = { silent = true },
            },
            {
              "<C-n>",
              function()
                require("copilot.suggestion").next()
              end,
              description = "Next suggestion",
              mode = { "i" },
              opts = { silent = true },
            },
            {
              "<C-\\>",
              function()
                require("copilot.panel").open({
                  position = "bottom",
                  ratio = 0.5,
                })
              end,
              description = "Show Copilot panel",
              mode = { "n", "i" },
            },
          },
        },
      })

      require("legendary").commands({
        {
          itemgroup = "Copilot",
          commands = {
            {
              ":CopilotToggle",
              function()
                require("copilot.suggestion").toggle_auto_trigger()
              end,
              description = "Toggle on/off for buffer",
            },
          },
        },
      })
    end,
    opts = {
      panel = {
        auto_refresh = true,
      },
      suggestion = {
        auto_trigger = true, -- Suggest as we start typing
        keymap = {
          accept_word = "<C-l>",
          accept_line = "<C-j>",
        },
      },
    },
  },
  {
    "folke/trouble.nvim",
    opts = {
      action_keys = {
        jump = { "<cr>" },
      },
    },
  },
}
