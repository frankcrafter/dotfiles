return {
	{ "hrsh7th/cmp-nvim-lsp" },
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"onsails/lspkind.nvim",
	"hrsh7th/cmp-cmdline",
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			local luasnip = require("luasnip")
			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = false,
					}),
				}),
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				sources = cmp.config.sources({
					{ name = "cmp_tabnine" },
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				}, {
					{ name = "buffer" },
				}),
				window = {
					completion = {
						border = "none",
						winhighlight = "Normal:CmpPmenu",
						scrollbar = "none",
					},
					documentation = {
						border = "rounded",
						winhighlight = "Normal:CmpDoc",
						scrollbar = "",
					},
				},
				formatting = {
					format = function(_, vim_item)
						vim_item.kind = " " .. lspkind.symbolic(vim_item.kind, { mode = "symbol" }) .. " "
						local maxwidth = 35
						vim_item.abbr = " " .. string.sub(vim_item.abbr, 1, maxwidth) .. "   "
						return vim_item
					end,
				},
				experimental = {
					ghost_text = {
						hl_group = "Comment",
					},
				},
			})
			-- Enable command-line search
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
				formatting = {
					fields = { "abbr" },
				},
			})
		end,
	},
}
