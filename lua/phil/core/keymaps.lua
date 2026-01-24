vim.g.mapleader = " "
local keymap = vim.keymap

-- split windows
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current window" })

-- replace stuff
keymap.set("n", "<leader>ra", ":%s/", { desc = "Replace all" })
keymap.set("n", "<leader>rr", ":%s/\\<<C-r><C-w>\\>/", { desc = "Replace word under cursor" })

-- open Explore
-- keymap.set("n", "<leader>e", "<cmd>Explore<CR>", {desc = "Open Explore"})

-- clear search
keymap.set("n", "<leader>cs", "<cmd>nohlsearch<CR>", { desc = "Clear search" })

-- Enable line wrapping globally
vim.o.wrap = true

-- Optional: Enable 'linebreak' to wrap at word boundaries (avoids breaking words)
vim.o.linebreak = true

-- Remap j/k to move by display lines (gj/gk behavior) in normal and visual modes
vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })
vim.keymap.set("v", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("v", "k", "gk", { noremap = true, silent = true })
