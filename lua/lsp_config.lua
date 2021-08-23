local lspconfig = require "lspconfig"
local saga = require("lspsaga")

vim.o.completeopt = "menuone,noselect"
vim.o.pumheight = 10
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits"
  }
}

local compe = require("compe")
compe.setup {
  enabled = true,
  autocomplete = true,
  debug = true,
  min_length = 1,
  preselect = "enable",
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = {
    border = "rounded",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1
  },
  source = {
    path = true,
    buffer = true,
    calc = true,
    nvim_lsp = true,
    nvim_lua = true,
    vsnip = true,
    ultisnips = true,
    luasnip = true,
    ["nvim-treesitter"] = true,
    tabnine = {
      max_line = 1000,
      max_num_results = 6,
      priority = 5000,
      show_prediction_strength = true,
      sort = false,
      ignore_pattern = "[(]"
    }
  }
}

lspconfig.clangd.setup {
  on_attach = compe.on_attach,
  capabilities = capabilities
}

lspconfig.rust_analyzer.setup(
  {
    settings = {
      ["rust-analyzer"] = {
        assist = {
          importGranularity = "module",
          importPrefix = "by_self"
        },
        cargo = {
          loadOutDirsFromCheck = true
        },
        procMacro = {
          enable = true
        }
      }
    }
  }
)

saga.init_lsp_saga(
  {
    max_preview_lines = 10,
    code_action_icon = "💡"
  }
)
