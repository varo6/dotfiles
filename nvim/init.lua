vim.keymap.set('n', 'O', ':NvimTreeToggle<CR>', {
	noremap = true
})
vim.wo.relativenumber = true

require("config.lazy")

-- Setup some plugins

require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c = { 'filename' },
		lualine_x = { 'encoding', 'fileformat', 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}

require("nvim-tree").setup()
require("telescope").setup()
require('telescope').load_extension('fzf')
require('live-server').setup(opts)

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- Conform will run the first available formatter
		javascript = { "prettierd", "prettier", stop_after_first = true },
		html = { "htmlbeautifier" },
	},
})

vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

require('render-markdown').setup({
	heading = {
		sign = false,
		position = 'inline',
		width = 'block',
		left_margin = 0.5,
		left_pad = 0.2,
		right_pad = 0.2,
		backgrounds = {
			'RenderMarkdownH1Bg',
			'RenderMarkdownH2Bg',
			'RenderMarkdownH3Bg',
			'RenderMarkdownH4Bg',
			'RenderMarkdownH5Bg',
			'RenderMarkdownH6Bg',
		},
		foregrounds = {
			'RenderMarkdownH1',
			'RenderMarkdownH2',
			'RenderMarkdownH3',
			'RenderMarkdownH4',
			'RenderMarkdownH5',
			'RenderMarkdownH6',
		},
	},
	paragraph = {
		left_margin = 0.5,
		min_width = 100,
	},

})
