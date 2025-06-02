-- Better escape using jk in insert and terminal mode
vim.keymap.set("i", "jk", "<ESC>")

-- Diagnostics
vim.keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, {})

-- New tab
vim.keymap.set("n", "te", ":tabedit<CR>")

-- Split window
vim.keymap.set("n", "ss", ":split<Return>", {})
vim.keymap.set("n", "sv", ":vsplit<Return>", {})

-- Move window
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sl", "<C-w>l")
