require "nvchad.mappings"

-- add yours here
-- TODO:  Add your custom mappings here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { desc = "General Save current file" })

map("n", "<leader>tw", "<cmd> set wrap! <CR>", { desc = "toggle Line wrap" })

-- foldmethod
map("n", "<leader>zi", "<cmd> setl foldmethod=indent <CR>", { desc = "Fold Indent fold" })
map("n", "<leader>zm", "<cmd> setl foldmethod=manual <CR>", { desc = "Fold Manual fold" })
map("n", "<leader>zx", function()
  vim.opt_local.foldmethod = "expr"
  vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
end, { desc = "Fold Expr fold" })

-- Telescope
map("n", "<leader>fp", "<cmd> Telescope projects <CR>", { desc = "Telescope Find projects" })
map("n", "<leader>d", "<cmd> Telescope diagnostics <CR>", { desc = "Telescope Show diagnostics" })
map("n", "<leader>fo", "<cmd> Telescope oldfiles only_cwd=ture <CR>", { desc = "Telescope Find oldfiles in cwd" })

-- todo-comments
map("n", "<leader>m", "<cmd> TodoTelescope <CR>", { desc = "Telescope Find TODOs" })

-- Neogen
map("n", "<leader>a", "<cmd> Neogen <CR>", { desc = "Commont Aenerate annotation" })

-- symbols_outline
map("n", "<leader>o", "<cmd> SymbolsOutline <CR>", { desc = "toggle Symbols outline" })

-- Disable mappings
local nomap = vim.keymap.del

nomap("n", "<leader>h")
nomap("n", "<leader>v")
