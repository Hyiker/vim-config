local lspconfig = require'lspconfig'
local saga = require'lspsaga'

lspconfig.ccls.setup{on_attach=require'completion'.on_attach}
saga.init_lsp_saga()
