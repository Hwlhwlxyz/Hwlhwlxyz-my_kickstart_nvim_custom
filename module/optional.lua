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
--vim行号
{ "sitiom/nvim-numbertoggle" }
}