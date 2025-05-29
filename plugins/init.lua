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
		opts.exclude = { filetypes = {"nofile", "dashboard"} }
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
  { 'justinmk/vim-gtfo', event = "VeryLazy" },
  -- 高亮 f and F
  {
    'jinh0/eyeliner.nvim',
    event = "VeryLazy",
    config = function()
      vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = '*',
        callback = function()
          vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg = '#FF0000', bold = true, underline = true })
          vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg = '#FF8C00', bold = true, underline = true })
        end,
      })
      require('eyeliner').setup { highlight_on_key = true,}
    end,
  },
  --  visual模式显示空白符号
  {
    'mcauley-penney/visual-whitespace.nvim',
    config = true,
    event = "ModeChanged *:[vV\22]",
    opts = {},
  },
    {
    'MagicDuck/grug-far.nvim',
    config = function()
      require('grug-far').setup({
      });
    end,
    keys = {
    {
      "<leader>g",
      function()
        local grug = require("grug-far")
        grug.open({
          transient = true,
        })
      end,
      mode = { "n", "v" },
      desc = "Search and Replace",
    },
    }
  },

}
