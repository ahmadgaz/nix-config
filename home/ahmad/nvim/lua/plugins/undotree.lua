return {
  'mbbill/undotree',
  config = function()
    vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
    vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { noremap = true, silent = true })
  end
}
