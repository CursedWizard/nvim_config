return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme can be a string like `catppuccin` or a function that will load the colorscheme
      ---@type string|fun()
      colorscheme = "tokyonight",
      -- load the default settings
      defaults = {
        autocmds = true, -- lazyvim.config.autocmds
        keymaps = true, -- lazyvim.config.keymaps
        options = true, -- lazyvim.config.options
      },
      -- icons used by other plugins
      icons = {
        diagnostics = {
          Error = " ",
          Warn = " ",
          Hint = " ",
          Info = " ",
        },
        git = {
          added = " ",
          modified = " ",
          removed = " ",
        },
        kinds = {
          Array = " ",
          Boolean = " ",
          Class = " ",
          Color = " ",
          Constant = " ",
          Constructor = " ",
          Copilot = " ",
          Enum = " ",
          EnumMember = " ",
          Event = " ",
          Field = " ",
          File = " ",
          Folder = " ",
          Function = " ",
          Interface = " ",
          Key = " ",
          Keyword = " ",
          Method = " ",
          Module = " ",
          Namespace = " ",
          Null = "ﳠ ",
          Number = " ",
          Object = " ",
          Operator = " ",
          Package = " ",
          Property = " ",
          Reference = " ",
          Snippet = " ",
          String = " ",
          Struct = " ",
          Text = " ",
          TypeParameter = " ",
          Unit = " ",
          Value = " ",
          Variable = " ",
        },
      },
    },
  },
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    enabled = false,
    dependencies = { { "ggandor/flit.nvim", opts = { labeled_modes = "nv" } } },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
    end,
  },

  {
    "phaazon/hop.nvim",
    branch = "v2",
    lazy = false,
    init = function()
      require("hop").setup({ keys = "esoxqpdflzhckivuran" })

      vim.keymap.set("n", "s", "<cmd>HopWord<cr>", {
        noremap = true,
        silent = true,
      })
    end,
  },
}
