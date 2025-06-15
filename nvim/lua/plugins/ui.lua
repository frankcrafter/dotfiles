return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			cmdline = {
				enabled = true,
				view = "cmdline_popup",
			},
		},
	},
	--- NOTIFY ---
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 1100,
			render = "wrapped-compact",
		},
	},
	--- BUFFERLINE ---
	{
		"akinsho/bufferline.nvim",
		config = function()
			require("bufferline").setup({
				options = {
					mode = "tabs",
					show_buffer_close_icons = false,
					show_close_icon = false,
					separator_style = "thin",
				},
			})
			vim.keymap.set("n", "<Tab>", "<Cmd>:BufferLineCycleNext<CR>")
			vim.keymap.set("n", "<S-Tab>", "<Cmd>:BufferLineCyclePrev<CR>")
			vim.keymap.set("n", "<S-c>", "<Cmd>bd<CR>")
		end,
	},
}
