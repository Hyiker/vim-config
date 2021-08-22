require'nvim-treesitter.configs'.setup {
  ensure_installed = {'c', 'cpp', 'toml', 'json', 'lua', 'python', 'bash', 'rust'},
  highlight = {
    enable = true,
  }
}
