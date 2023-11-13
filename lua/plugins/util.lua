return {
  "nvim-lua/plenary.nvim", -- Required dependency for many plugins. Super useful Lua functions
  {
    "mrjones2014/legendary.nvim", -- A command palette for keymaps, commands and autocmds
    lazy = false,
    priority = 900,
    dependencies = "kkharji/sqlite.lua",
    init = function()
      -- require("legendary").keymaps({
      --   {
      --     "<C-p>",
      --     require("legendary").find,
      --     hide = true,
      --     description = "Open Legendary",
      --     mode = { "n", "v" },
      --   },
      -- })
    end,
    config = function()
      require("legendary").setup({
        select_prompt = "Legendary",
        include_builtin = false,
        include_legendary_cmds = false,
        which_key = { auto_register = false },
      })
    end,
  },
  {
    "kevinhwang91/rnvimr",
    lazy = false,
    enabled = true,
    init = function()
      vim.keymap.set("n", "<Space>r", [[:RnvimrToggle<CR>]], { noremap = true, silent = true })
      vim.g.rnvimr_enable_picker = 1
    end,
  },
  {
    "kelly-lin/ranger.nvim",
    enabled = false,
    config = function()
      require("ranger-nvim").setup({ replace_netrw = true })
      vim.api.nvim_set_keymap("n", "<Space>r", "", {
        noremap = true,
        callback = function()
          require("ranger-nvim").open(true)
        end,
      })
    end,
  },
  {
    "kevinhwang91/nvim-bqf", -- Better quickfix window,
    ft = "qf",
  },
  { "github/copilot.vim", lazy = false, enabled = false },
  {
    "rafamadriz/friendly-snippets",
    enabled = false,
  },
  {
    "folke/flash.nvim",
    enabled = false,
  },
  {
    "chentoast/marks.nvim",
    config = function ()
      require("marks").setup({})
    end
  },
  {
    "L3MON4D3/LuaSnip",
    config = function ()
      require("luasnip.loaders.from_vscode").load({})
    end
  },
  {
    "lmburns/lf.nvim",
    dependencies = "akinsho/toggleterm.nvim",
    enabled = false,
    config = function ()
      require("lf").setup({})
      -- vim.keymap.set(
      --   "n",
      --   "<Space>r",
      --   function ()
      --     require("lf").start(nil)
      --   end,
      --   { noremap = true, silent = true }
      -- )
    end
  }
}
