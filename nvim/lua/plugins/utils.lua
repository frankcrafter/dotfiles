return {
	--- BASE ---
	{
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	--- TREESITTER ---
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua" },
				auto_install = true,
			})
		end,
	},
	--- TELESCOPE ---
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						theme = "dropdown",
					},
					live_grep = {
						theme = "dropdown",
					},
					grep_string = {
						theme = "dropdown",
					},
				},
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>gs", builtin.grep_string, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
	--- AUTOPAIRS ---
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	--- AUTOTAGS ---
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	--- nvim-highlight-colors ---
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	--- NvimTree ---
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		config = function()
			require("nvim-tree").setup({
				view = {
					width = 38,
				},
				actions = {
					open_file = {
						quit_on_open = true,
					},
				},
			})
			vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", {})
		end,
	},
	--- LUALINE ---
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			local lualine = require("lualine")
			local colors = {
				bg = "#242340",
				fg = "#cdd6f4",
				yellow = "#f9e2af",
				cyan = "#94e2d5",
				darkblue = "#313244",
				green = "#A6E3A1",
				orange = "#FAB387",
				violet = "#B4BEFE",
				magenta = "#F38BA8",
				blue = "#80A7EA",
				red = "#f16a9b",
			}

			local conditions = {
				buffer_not_empty = function()
					return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
				end,
				hide_in_width = function()
					return vim.fn.winwidth(0) > 80
				end,
				check_git_workspace = function()
					local filepath = vim.fn.expand("%:p:h")
					local gitdir = vim.fn.finddir(".git", filepath .. ";")
					return gitdir and #gitdir > 0 and #gitdir < #filepath
				end,
			}

			-- Config
			local config = {
				options = {
					component_separators = "",
					section_separators = "",
					theme = {
						normal = { c = { fg = colors.fg, bg = colors.bg } },
						inactive = { c = { fg = colors.fg, bg = colors.bg } },
					},
				},
				sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_y = {},
					lualine_z = {},
					lualine_c = {},
					lualine_x = {},
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_y = {},
					lualine_z = {},
					lualine_c = {},
					lualine_x = {},
				},
			}

			local function ins_left(component)
				table.insert(config.sections.lualine_c, component)
			end
			local function ins_right(component)
				table.insert(config.sections.lualine_x, component)
			end

			ins_left({
				function()
					return ""
				end,
				color = { fg = colors.darkblue },
				padding = { left = 0, right = 0 },
			})

			ins_left({
				function()
					return ""
				end,
				color = { fg = colors.green, bg = colors.darkblue },
				padding = { right = 1, left = 1 },
			})

			ins_left({
				function()
					return ""
				end,
				color = { fg = colors.darkblue },
				padding = { left = 0, right = 0 },
			})

			ins_left({
				"filesize",
				cond = conditions.buffer_not_empty,
			})

			ins_left({
				"filename",
				cond = conditions.buffer_not_empty,
				color = { fg = colors.blue, gui = "bold" },
			})

			ins_left({ "location" })

			ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } })

			ins_left({
				function()
					return "%="
				end,
			})
			ins_right({
				"o:encoding",
				fmt = string.upper,
				cond = conditions.hide_in_width,
				color = { fg = colors.blue, gui = "bold" },
			})
			ins_right({
				"diff",
				symbols = { added = " ", modified = "󰝤 ", removed = " " },
				diff_color = {
					added = { fg = colors.green },
					modified = { fg = colors.orange },
					removed = { fg = colors.red },
				},
				cond = conditions.hide_in_width,
			})

			ins_right({
				function()
					return ""
				end,
				color = { fg = colors.violet }, -- Sets highlighting of component
				padding = { left = 1, right = 0 }, -- We don't need space before this
			})
			ins_right({
				"fileformat",
				fmt = string.upper,
				icons_enabled = true,
				color = { bg = colors.violet, fg = colors.bg },
			})

			ins_right({
				function()
					return ""
				end,
				color = { fg = colors.violet }, -- Sets highlighting of component
				padding = { left = 0, right = 1 }, -- We don't need space before this
			})
			ins_right({
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = "󰋼 " },
				diagnostics_color = {
					error = { fg = colors.red },
					warn = { fg = colors.yellow },
					info = { fg = colors.cyan },
				},
			})
			ins_right({
				function()
					return ""
				end,
				color = { fg = colors.magenta, bg = colors.bg },
				padding = { left = 1, right = 0 },
			})
			ins_right({
				function()
					local msg = "No Lsp"
					local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
					local clients = vim.lsp.get_clients()
					if next(clients) == nil then
						return msg
					end
					for _, client in ipairs(clients) do
						local filetypes = client.config.filetypes
						if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
							return client.name
						end
					end
					return msg
				end,
				icon = " ",
				color = { fg = colors.bg, bg = colors.magenta, gui = "bold" },
			})

			ins_right({
				function()
					return ""
				end,
				color = { fg = colors.magenta },
				padding = { left = 0, right = 0 },
			})
			lualine.setup(config)
		end,
	},
}
