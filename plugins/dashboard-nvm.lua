return {
  "nvimdev/dashboard-nvim",
  optional = false,
  opts = function(_, opts)
    
    if not vim.tbl_get(opts, "config", "center") then
      return
    end

    local projects = {
      action = pick,
      desc = " Projects",
      icon = " ",
      key = "p",
    }

    projects.desc = projects.desc .. string.rep(" ", 43 - #projects.desc)
    projects.key_format = "  %s"

    table.insert(opts.config.center, 3, projects)

  end,
}