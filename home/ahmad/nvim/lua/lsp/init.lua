vim.lsp.enable('lua_ls')
vim.lsp.enable('pyright')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('clangd')
vim.lsp.enable('verible')
vim.lsp.enable('asm_lsp')
vim.lsp.enable('jdtls')
vim.lsp.enable('terraformls')
vim.lsp.enable('sqls')
vim.lsp.enable('nixd')
vim.lsp.config('nixd', {
  settings = { nixd = {
    formatting = { command = { "nixfmt" } },
    nixpkgs = {
      expr = 'import (builtins.getFlake "/home/ahmad/nix-config").inputs.nixpkgs { }',
    },
    options = {
      nixos = {
        expr = '(builtins.getFlake "/home/ahmad/nix-config").nixosConfigurations.sunny.options',
      },
      home_manager = {
        expr = '(builtins.getFlake "/home/ahmad/nix-config").homeConfigurations."ahmad@sunny".options',
      },
    },
  }}
})

-- Web dev
vim.lsp.enable('ruby_lsp')
vim.lsp.enable('ts_ls')
vim.lsp.enable('eslint')
vim.lsp.enable('tailwindcss')
vim.lsp.enable('emmet_language_server')
vim.lsp.enable('html')
vim.lsp.enable('cssls')
