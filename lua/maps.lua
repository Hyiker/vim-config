local M = {}
local visualConfig = {
}
local insertConfig = {
    {from = "jk", to = "<Esc>"}
}
local normalConfig = {
  {from = "ql", to = "<cmd>Neoformat<CR>"}
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
