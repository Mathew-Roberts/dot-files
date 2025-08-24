return {
  {
    'miroshQa/debugmaster.nvim',
    dependencies = { 'mfussenegger/nvim-dap', 'mfussenegger/nvim-dap-python' },
    config = function()
      local dm = require 'debugmaster'
      vim.keymap.set({ 'n', 'v' }, '<leader>d', dm.mode.toggle, { nowait = true })
      dm.plugins.osv_integration.enabled = true -- needed if you want to debug neovim lua code

      local dap = require 'dap'
      vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
      vim.keymap.set('n', '<leader>dt', dap.terminate, { desc = 'Debug: Terminate Session' })
      vim.keymap.set('n', '<leader>dr', dap.restart, { desc = 'Debug: Restart Session' })
      -- local path = '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python'
      -- require('dap-python').setup(path)
      require('dap-python').setup 'uv'
    end,
  },
}
