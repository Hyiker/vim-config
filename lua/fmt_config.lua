require("formatter").setup(
  {
    filetype = {
      cpp = {
        -- clang-format
        function()
          return {
            exe = "clang-format",
            args = {},
            stdin = true,
            cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
          }
        end
      },
      lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      },
      rust = {
        -- Rustfmt
        function()
          return {
            exe = "rustfmt",
            args = {"--emit=stdout"},
            stdin = true
          }
        end
      }
    }
  }
)
vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.rs,*.lua FormatWrite
augroup END
]],
  true
)
