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
return {
	{'heavenshell/vim-jsdoc'}, -- run npm install in: nvim-data\lazy\vim-jsdoc\lib
}