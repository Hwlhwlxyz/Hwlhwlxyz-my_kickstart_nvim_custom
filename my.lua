-- ~/.config/nvim/lua/custom/mymodule.lua
-- add require('custom.my').setup() to init.lua

local M = {}

local paste_check = function()
  local clipboard = vim.fn.getreg '+'
  if string.find(clipboard, '\n') then -- that find, meh..
    local win = vim.api.nvim_get_current_win()
    local pos = vim.api.nvim_win_get_cursor(win) --vim.api.nvim_buf_set_lines(0, pos[1], pos[1], false, {''})
    vim.api.nvim_command 'pu' -- TODO: 'u' only if not line.trim is nothing| https://stackoverflow.com/a/1346747/11465149
    vim.api.nvim_win_set_cursor(win, { pos[1] + 1, pos[2] })
    return '' --clipboard:sub(0,-2)
  end
  return clipboard
end

--https://github.com/GiorgosXou/init.lua
local polish = function() -- This function is run last -- good place to configure mappings and vim options
  local map = vim.keymap
  local bufopts = { silent = true }
  map.set('i', '<C-s>', '<C-o>:w!<CR>', bufopts) -- On blank line stays on normal mode
  map.set('n', '<C-s>', ':w!<CR>', bufopts)
  map.set('i', '<C-LeftMouse>', '<LeftMouse><C-o>:lua vim.lsp.buf.definition()<CR>', bufopts) -- Go to definition
  map.set('n', '<C-LeftMouse>', '<LeftMouse>:lua vim.lsp.buf.definition()<CR>', bufopts) -- Go to definition
  map.set('v', '<C-c>', 'ygv', bufopts) -- https://stackoverflow.com/questions/47842041/
  map.set('i', '<C-c>', '<C-o>yy', bufopts)
  map.set('v', '<C-v>', '"_dgP', bufopts)
  vim.keymap.set('i', '<C-v>', function()
    local text = paste_check()
    vim.api.nvim_put({ text }, 'c', true, true)
  end, bufopts)
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
end

local auto_hide_cmdline = function()
  --cmdline自动隐藏
  vim.api.nvim_create_autocmd('CmdlineEnter', {
    group = vim.api.nvim_create_augroup('gmr_cmdheight_1_on_cmdlineenter', { clear = true }),
    desc = "Don't hide the status line when typing a command",
    command = ':set cmdheight=1',
  })

  vim.api.nvim_create_autocmd('CmdlineLeave', {
    group = vim.api.nvim_create_augroup('gmr_cmdheight_0_on_cmdlineleave', { clear = true }),
    desc = 'Hide cmdline when not typing a command',
    command = ':set cmdheight=0',
  })

  vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('gmr_hide_message_after_write', { clear = true }),
    desc = 'Get rid of message after writing a file',
    pattern = { '*' },
    command = 'redrawstatus',
  })
end

M.setup = function()
  --缩进
  -- The line beneath this is called `modeline`. See `:help modeline`
  -- vim: ts=2 sts=2 sw=2 et
  vim.opt.smarttab = true
  vim.opt.expandtab = true
  vim.opt.tabstop = 2
  vim.opt.shiftwidth = 2
  vim.opt.softtabstop = 2
  vim.wo.wrap = false
  --设置注释
  vim.keymap.set({ 'n' }, '<C-_>', 'gcc', { remap = true })
  vim.keymap.set({ 'v' }, '<C-_>', 'gc', { remap = true })
  vim.keymap.set({ 'i' }, '<C-_>', '<ESC>gcc', { remap = true })

  polish()
  auto_hide_cmdline()

  vim.cmd.colorscheme 'penumbra-highcontrast'
  vim.o.background = 'light'
end

return M
