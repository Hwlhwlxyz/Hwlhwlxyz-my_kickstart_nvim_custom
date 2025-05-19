local function setup_filetype_indent()
    -- TypeScript/JavaScript files
    vim.api.nvim_create_autocmd("FileType", {
        pattern = {"typescript", "typescriptreact", "javascript", "javascriptreact"},
        callback = function()
            vim.opt.expandtab = false  -- Use tabs
            vim.opt.tabstop = 2
            vim.opt.shiftwidth = 2
            vim.opt.softtabstop = 2
        end
    })
end
setup_filetype_indent()

local function run_dprint_format()
	local filepath = vim.fn.expand("%:p")
	  vim.cmd("write")
	  vim.fn.jobstart({ "dprint", "fmt", filepath }, {
		on_exit = function()
		  vim.cmd("silent! edit")
		end,
	  })
end
local dprint_autoformat_enabled = {}
vim.api.nvim_create_user_command("DprintFormat", function(opts)
    local buf = vim.api.nvim_get_current_buf()

  if opts.args == "toggle" then
    if dprint_autoformat_enabled[buf] then
      dprint_autoformat_enabled[buf] = false
      vim.api.nvim_clear_autocmds({ group = "DprintAutoFormat", buffer = buf })
      vim.notify("dprint autoformat disabled", vim.log.levels.INFO)
    else
      dprint_autoformat_enabled[buf] = true
      vim.api.nvim_create_augroup("DprintAutoFormat", { clear = false })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = "DprintAutoFormat",
        buffer = buf,
        callback = run_dprint_format,
      })
      vim.notify("dprint autoformat enabled", vim.log.levels.INFO)
    end
  else
    run_dprint_format()
  end
end, { desc = "Run dprint fmt on current buffer, or toggle autoformat with ':DprintFormat toggle'",
  nargs = "?",
   })

return {
	{'heavenshell/vim-jsdoc'}, -- run npm install in: nvim-data\lazy\vim-jsdoc\lib
}