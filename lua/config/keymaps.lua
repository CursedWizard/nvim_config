-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

local map = function(mode, key, fn, opts)
  vim.api.nvim_set_keymap(mode, key, fn, opts or {})
end

local opts = {
  noremap = true,
  silent = true,
}

-- Create and move to split
-- Check if a split already exists in the direction you want to move to.
-- If it does, the function simply moves the focus to that split.
-- If there isn’t a split already, the function creates a new split and
-- moves the focus to that split
function WinMove(key)
  local curwin = vim.fn.winnr()
  -- wincmd in lua
  vim.fn.execute("wincmd " .. key)

  if curwin == vim.fn.winnr() then
    if vim.fn.match(key, "[jk]") then
      vim.fn.execute("wincmd v")
    else
      vim.fn.execute("wincmd s")
    end
  end
end

-- to unmap tab basically
map('n', '<C-p>', [[<C-i>]], opts)

map('i', '<C-z>', [[<C-^>]], opts)

-- Remap d key so that it doesnt cut the text
map("v", "d", [["_c]], opts)
map("n", "dd", [["_dd]], opts)
map("n", "dw", [["_dd]], opts)
map("n", "de", [["_de]], opts)
map("n", "dl", [["_dl]], opts)

map("n", "<Tab>i", [[<C-w>c]], opts)
map("n", "<Tab>o", [[<C-w>o]], opts)
map("n", "<Tab>j", [[<C-w>j]], opts)
map("n", "<Tab>k", [[<C-w>k]], opts)
map("n", "<Tab>l", [[:lua WinMove('l')<CR>]], opts)
map("n", "<Tab>h", [[:lua WinMove('h')<CR>]], opts)

-- Move to the end of a line
map("n", "L", [[$]], opts)
map("v", "L", [[$]], opts)
map("o", "L", [[$]], opts)

map("n", "H", [[^]], opts)
map("v", "H", [[^]], opts)
map("o", "H", [[^]], opts)

if Util.has("bufferline.nvim") then
  map("n", "<C-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "<C-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
  map("n", "<C-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "<C-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
end

map("n", "<C-c>", "<cmp>BufferLinePickClose<CR>", opts)
map("n", "<C-b>", "<cmp>BufferLinePick<CR>", opts)

-- map("n", "<leader>l", [[:lua Telescope live_grep")<CR>]]) a
