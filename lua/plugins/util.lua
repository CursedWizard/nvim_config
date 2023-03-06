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
    init = function()
      vim.keymap.set("n", "<Space>r", [[:RnvimrToggle<CR>]], { noremap = true, silent = true })
      vim.g.rnvimr_enable_picker = 1
    end,
  },
  {
    "kevinhwang91/nvim-bqf", -- Better quickfix window,
    ft = "qf",
  },
  { "github/copilot.vim", lazy = false, enabled = false },
}
