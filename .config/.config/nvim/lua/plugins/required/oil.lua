return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup {
      keymaps = { ['<C-h>'] = { false }, ['<C-l>'] = { false } },
      view_options = {
        show_hidden = false,
      },
    }

    local oil = require 'oil'
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    vim.keymap.set('n', '<leader>sh', oil.toggle_hidden, { desc = '[S]how [H]idden files' })
  end,
}
