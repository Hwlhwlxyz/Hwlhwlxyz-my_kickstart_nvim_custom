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
  
local function open_grug_far(prefills)
      local grug_far = require("grug-far")

      if not grug_far.has_instance("explorer") then
        grug_far.open({ instanceName = "explorer" })
      else
        grug_far.get_instance('explorer'):open()
      end
      -- doing it seperately because multiple paths doesn't open work when passed with open
      -- updating the prefills without clearing the search and other fields
      grug_far.get_instance('explorer'):update_input_values(prefills, false)
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
	commands = {
        -- create a new neo-tree command
        grug_far_replace = function(state)
          local node = state.tree:get_node()
          local prefills = {
            -- also escape the paths if space is there
            -- if you want files to be selected, use ':p' only, see filename-modifiers
            paths = node.type == "directory" and vim.fn.fnameescape(vim.fn.fnamemodify(node:get_id(), ":p"))
        or vim.fn.fnameescape(vim.fn.fnamemodify(node:get_id(), ":h")),
          }
          open_grug_far(prefills)
        end,
        -- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/fbb631e818f48591d0c3a590817003d36d0de691/doc/neo-tree.txt#L535
        grug_far_replace_visual = function(state, selected_nodes, callback)
          local paths = {}
          for _, node in pairs(selected_nodes) do
            -- also escape the paths if space is there
            -- if you want files to be selected, use ':p' only, see filename-modifiers
            local path = node.type == "directory" and vim.fn.fnameescape(vim.fn.fnamemodify(node:get_id(), ":p"))
        or vim.fn.fnameescape(vim.fn.fnamemodify(node:get_id(), ":h"))
            table.insert(paths, path)
          end
          local prefills = { paths = table.concat(paths, "\n") }
          open_grug_far(prefills)
        end,
      },
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
          ['<Space>r']=goto_root,
           ['z'] = "grug_far_replace",
        },
      },
    },
    default_component_configs  = {
		name = {
			highlight_opened_files = true -- 高亮已经打开的文件
		}
    }
  },
}
