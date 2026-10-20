-- Completion
vim.keymap.set("i", "<C-Space>", "<C-x><C-o>")

-- Diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>l', vim.diagnostic.setloclist)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist)
vim.keymap.set('n', '[e', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']e', vim.diagnostic.goto_next)
-- vim.keymap.set("n", "<leader>va", ":lua vim.diagnostic.enable()<CR>")

-- Moving cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Moving code
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Modifying code
vim.keymap.set("n", "<leader>fo", vim.lsp.buf.format)
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("x", "<leader>r", function()
  local saved_reg = vim.fn.getreg('"')
  local saved_type = vim.fn.getregtype('"')
  vim.cmd('normal! "ry')
  vim.fn.setreg('"', saved_reg, saved_type)
  local text = vim.fn.escape(vim.fn.getreg('r'), '/\\')
  vim.api.nvim_feedkeys(
    vim.api.nvim_replace_termcodes(
      ':%s/' .. text .. '/', true, false, true
    ),
    'n',
    false
  )
end)

-- Misc
vim.keymap.set("n", "Q", "<nop>")
