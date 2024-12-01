return {
  'danymat/neogen',
  config = function()
    require('neogen').setup {}
    vim.keymap.set('n', '<leader>nf', ":lua require('neogen').generate()<CR>")
    vim.keymap.set('n', '<Leader>nc', ":lua require('neogen').generate({ type = 'class' })<CR>")
  end,
}
