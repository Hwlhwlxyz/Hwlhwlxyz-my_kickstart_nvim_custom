local ls = require("luasnip")
local f = ls.function_node

-- Function to get current function name using treesitter
local function get_current_function_name()
  local ts_utils = require("nvim-treesitter.ts_utils")
  local node = ts_utils.get_node_at_cursor()

  while node do
    if node:type() == "function_declaration" or node:type() == "function_definition"
      or node:type() == "method_declaration" then
      for i = 0, node:named_child_count() - 1 do
        local child = node:named_child(i)
        if child:type() == "identifier" then
          return ts_utils.get_node_text(child, 0)
        end
      end
    end
    node = node:parent()
  end

  return "unknown_function"
end

ls.add_snippets("typescript", {
  ls.snippet("lo", {
    t("logger.info({'fn':'"),
    f(function() return get_current_function_name() end),
    ls.text_node("'"),
    i(0),  -- This is where the cursor will end up
    ls.text_node("})"),
  }),
})