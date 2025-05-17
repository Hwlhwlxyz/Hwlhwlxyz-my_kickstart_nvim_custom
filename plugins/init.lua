-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  
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
  --  打开当前文件所在目录
  { 'justinmk/vim-gtfo' }
}
