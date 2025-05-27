return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
  },
  { 'aonemd/quietlight.vim' , optional=true},
  { 'tobi-wan-kenobi/zengarden' },
  { 'iibe/gruvbox-high-contrast' },
  { 'catppuccin/nvim', name = 'catppuccin' },
  { 'morhetz/gruvbox' },
  { 'wtfox/jellybeans.nvim', opts = {} },
  {
    'zenbones-theme/zenbones.nvim',
    dependencies = 'rktjmp/lush.nvim',
    lazy = false,
    -- you can set set configuration options here
    -- config = function()
    --     vim.g.zenbones_darken_comments = 45
    --     vim.cmd.colorscheme('zenbones')
    -- end
  },
  { 'savq/melange-nvim' },
  {'shaunsingh/solarized.nvim'},
    {
    -- 自定义加载逻辑，加载本地插件
    plugin_path = vim.fn.stdpath 'config' .. '/lua/custom/plugins/local_plugin/penumbra_highcontrast',
    dir = vim.fn.stdpath 'config' .. '/lua/custom/plugins/local_plugin/penumbra_highcontrast',
    name = 'penumbra-highcontrast',
  },
  { "EdenEast/nightfox.nvim" }
}