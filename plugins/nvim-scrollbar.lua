return {
  'petertriho/nvim-scrollbar',
  event = "VeryLazy",
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'kevinhwang91/nvim-hlslens',
  },
  opts = {},
  config = function()
    require('scrollbar').setup({
		set_highlights = false,
        excluded_buftypes = {
        "terminal",
        "nofile",
        "popup",
        "noice",
		},
		excluded_filetypes = {
		"dashboard",
		"dashboardPrompt",
		"prompt",
        "TelescopePrompt",
        "noice",
			"popup",
			"noice",
			"blink-cmp-menu",
			"blink-cmp-signature",
			"blink-cmp-documentation",
		},
    })
    require('gitsigns').setup()
    require('hlslens').setup {
      build_position_cb = function(plist, _, _, _)
        require('scrollbar.handlers.search').handler.show(plist.start_pos)
      end,
    }
    require('scrollbar.handlers.gitsigns').setup()
    require('scrollbar.handlers.search').setup()
    
  end,
}