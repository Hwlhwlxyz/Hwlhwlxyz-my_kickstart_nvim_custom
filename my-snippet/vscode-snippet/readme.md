Reference from 'rafamadriz/friendly-snippets'
Add to init.lua in dependencies 'L3MON4D3/LuaSnip'
```lua
config = function()
	require("luasnip.loaders.from_vscode").load { paths = "./lua/custom/my-snippet" }
end,
```