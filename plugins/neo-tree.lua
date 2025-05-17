-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

-- 跳转到git项目根目录
local goto_root = function()
	local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
	if git_root ~= "" then
	  vim.cmd("Neotree dir=" .. git_root)
	else
	  vim.cmd("Neotree")
	end
  end
      
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    { '<leader>r', goto_root,
      desc = "Open Neo-tree at git root or current dir",
      silent = true
    },
  },
  opts = {
	close_if_last_window = true,
    filesystem = {
		root_path = function()
		  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
		  if git_root ~= "" then
			return git_root
		  end
		  return vim.fn.getcwd()
		end,
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['<leftrelease>'] = 'open',
          ['<Space>r']=goto_root
        },
      },
    },
  },
}
