return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      -- config
      theme = 'hyper',
      shortcuts_left_side = true,
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}