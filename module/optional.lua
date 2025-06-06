--START mynumbertoggle logic  --vim行号
local augroup = vim.api.nvim_create_augroup("mynumbertoggle", { clear = true })

local release_timer = nil
local is_holding = false
local press_count = 0
local function has_pending_count()
  local count = vim.fn.getcmdtype() == "" and vim.v.count or 0
  return count > 0
end
local function on_key_release_simulated()
  if release_timer and not release_timer:is_closing() then
    release_timer:stop()
    release_timer:close()
  end
  release_timer = vim.loop.new_timer()
  vim.wo.relativenumber = false
  release_timer:start(550, 0, function()
    vim.schedule(function()
    is_holding = false
      if vim.api.nvim_get_mode().mode == "n"   then
        vim.wo.relativenumber = true
      end
      press_count = 0
    end)
  end)
end

local function on_key_press()
  if vim.bo.filetype == "dashboard" or vim.bo.filetype == "alpha" then
    return
  end
  if has_pending_count() then
    -- Skip toggle logic if there's a numeric prefix (e.g. 5j)
    return
  end
  if not is_holding then
    -- First press in a sequence, mark holding
    vim.wo.relativenumber = true
    is_holding = true
    press_count = 0
  end
  press_count = press_count + 1
--  vim.wo.relativenumber = not vim.wo.relativenumber
  on_key_release_simulated()
end
-- Intercept 'j' and 'k' keys in normal mode
vim.keymap.set("n", "j", function()
  on_key_press()
  return "j"
end, { expr = true, noremap = true })

vim.keymap.set("n", "k", function()
  on_key_press()
  return "k"
end, { expr = true, noremap = true })

vim.api.nvim_create_autocmd({"ModeChanged", "InsertLeave","BufEnter", "FocusGained", "CmdlineLeave", "WinEnter" }, {
  callback = function()
    if vim.api.nvim_get_mode().mode == "i" then
      vim.wo.relativenumber = false
    end
    if vim.api.nvim_get_mode().mode == "n" then
      vim.wo.relativenumber = true
    end
  end,
})
--END mynumbertoggle logic 

return {
--活跃窗口高亮
{
  "nvim-zh/colorful-winsep.nvim",
  config = true,
  event = { "WinLeave" },
},
--  register查看
  {'gennaro-tedesco/nvim-peekup'},
--  mark标记功能增强
  {
  "chentoast/marks.nvim",
  event = "VeryLazy",
  opts = {},
},
{
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({
        ui = {
        code_action = ''
    },
			symbol_in_winbar={enable=false},
			code_action={num_shortcut=true,show_server_name = false,extend_gitsigns = false}
        })
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    }
},
}