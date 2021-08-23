local M = {}
local visualConfig = {}
local insertConfig = {
  {from = "jk", to = "<Esc>"},
  {from = "<tab>", to = "v:lua.tab_complete()", options = {expr = true, silent = true}},
  {from = "<s-tab>", to = "v:lua.s_tab_complete()", options = {expr = true, silent = true}}
}
local normalConfig = {
  {from = "ql", to = "<cmd>FormatWrite<CR>"}
}

function M.init_maps()
  for _, i in ipairs(insertConfig) do
    local options = i.options or {silent = true}
    vim.api.nvim_set_keymap("i", i.from, i.to, options)
  end
  for _, n in ipairs(normalConfig) do
    local options = n.options or {silent = true}
    vim.api.nvim_set_keymap("n", n.from, n.to, options)
  end
  for _, n in ipairs(visualConfig) do
    local options = n.options or {silent = true}
    vim.api.nvim_set_keymap("v", n.from, n.to, options)
  end
end
return M
