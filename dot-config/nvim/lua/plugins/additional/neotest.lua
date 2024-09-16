return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-neotest/neotest-python',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-python',
      },
    }
    local neotest = require 'neotest'
    vim.keymap.set('n', '<leader>ts', neotest.summary.toggle, { desc = 'Neotest: View Tests in Directory' })
    vim.keymap.set('n', '<leader>tr', neotest.run.run, { desc = 'Neotest: Run test under cursor' })
    vim.keymap.set('n', '<leader>tf', function()
      neotest.run.run(vim.fn.expand '%')
    end, { desc = 'Neotest: Run all tests in file' })
    vim.keymap.set('n', '<leader>td', function()
      neotest.run.run { strategy = 'dap' }
    end, { desc = 'Neotest: Debug test under cursor' })
    vim.keymap.set('n', '<leader>to', neotest.output.open, { desc = 'Neotest: Float output of test panel' })
    vim.keymap.set('n', '<leader>tp', neotest.output_panel.open, { desc = 'Neotest: Ouput Panel' })
  end,
}
