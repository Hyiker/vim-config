require("nvim-tree").setup {
  actions = {
    open_file = {
      resize_window = true
    }
  },
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {},
  hijack_directories = {
    enable = true,
    auto_open = true
  },
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = false,
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = ""
    }
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = { ".git", "node_modules", ".cache" }
  },
  system_open = {
    cmd = nil,
    args = {}
  },
  view = {
    width = 30,
    height = 30,
    side = "left",
    mappings = {
      custom_only = false,
      list = {}
    }
  }
}
