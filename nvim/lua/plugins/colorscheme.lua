return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				color_overrides = {
					all = {
						rosewater = "#ded7d0",
						flamingo = "#cfd0d7",
						pink = "#d895c7",
						mauve = "#fd98b9",
						red = "#f45c7f",
						maroon = "#fd98b9",
						peach = "#ecc48d",
						yellow = "#ecc48d",
						green = "#76c5a4",
						teal = "#76c5a4",
						sky = "#8DBBD4",
						sapphire = "#8bb8d0",
						blue = "#9fd4ff",
						lavender = "#cfd0d7",
						text = "#ebefff",
						subtext1 = "#b8c0e0",
						subtext0 = "#a5adcb",
						overlay2 = "#939ab7",
						overlay1 = "#8087a2",
						overlay0 = "#6e738d",
						surface2 = "#5b6078",
						surface1 = "#494d64",
						surface0 = "#363a4f",
						base = "#242340",
						mantle = "#21203a",
						crust = "#1f2430",
					},
				},
				custom_highlights = function(C)
					return {
						CmpItemKindSnippet = { fg = C.base, bg = C.mauve },
						CmpItemKindKeyword = { fg = C.base, bg = C.red },
						CmpItemKindText = { fg = C.base, bg = C.teal },
						CmpItemKindMethod = { fg = C.base, bg = C.blue },
						CmpItemKindConstructor = { fg = C.base, bg = C.blue },
						CmpItemKindFunction = { fg = C.base, bg = C.blue },
						CmpItemKindFolder = { fg = C.base, bg = C.blue },
						CmpItemKindModule = { fg = C.base, bg = C.blue },
						CmpItemKindConstant = { fg = C.base, bg = C.peach },
						CmpItemKindField = { fg = C.base, bg = C.green },
						CmpItemKindProperty = { fg = C.base, bg = C.green },
						CmpItemKindEnum = { fg = C.base, bg = C.green },
						CmpItemKindUnit = { fg = C.base, bg = C.green },
						CmpItemKindClass = { fg = C.base, bg = C.yellow },
						CmpItemKindVariable = { fg = C.base, bg = C.flamingo },
						CmpItemKindFile = { fg = C.base, bg = C.blue },
						CmpItemKindInterface = { fg = C.base, bg = C.yellow },
						CmpItemKindColor = { fg = C.base, bg = C.red },
						CmpItemKindReference = { fg = C.base, bg = C.red },
						CmpItemKindEnumMember = { fg = C.base, bg = C.red },
						CmpItemKindStruct = { fg = C.base, bg = C.blue },
						CmpItemKindValue = { fg = C.base, bg = C.peach },
						CmpItemKindEvent = { fg = C.base, bg = C.blue },
						CmpItemKindOperator = { fg = C.base, bg = C.blue },
						CmpItemKindTypeParameter = { fg = C.base, bg = C.blue },
						CmpItemKindCopilot = { fg = C.base, bg = C.teal },
					}
				end,
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
