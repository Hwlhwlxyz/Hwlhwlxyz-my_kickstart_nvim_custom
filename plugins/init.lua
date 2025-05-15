-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      vim.cmd.colorscheme 'rose-pine'
    end,
  },
  { 'catppuccin/nvim', name = 'catppuccin' },
  { 'morhetz/gruvbox' },
  { 'wtfox/jellybeans.nvim', lazy = false, priority = 1000, opts = {} },
  -- 彩虹缩进
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = function(_, opts)
      -- Other blankline configuration here
      return require('indent-rainbowline').make_opts(opts)
    end,
    dependencies = {
      'TheGLander/indent-rainbowline.nvim',
    },
  },
  -- 显示跳转文件
  { 'lewis6991/whatthejump.nvim' },
}
