return {
  'akinsho/toggleterm.nvim',
  event = 'VeryLazy',
  version = '*',
  config = function()
    require('toggleterm').setup {
      open_mapping = '<C-s>', -- Set <C-s> to toggle the terminal
      direction = 'float', -- Open terminal as a floating window
      float_opts = {
        border = 'curved', -- Customize border style (options: single, double, shadow, etc.)
        size = 10,
        highlights = {
          border = 'Normal', -- Border highlight
          background = 'Normal', -- Background highlight
        },
      },
    }
    local terminal = require('toggleterm.terminal').Terminal
    local lazygit = terminal:new {
      cmd = 'lazygit',
      dir = 'git_dir',
      direction = 'float',
      float_opts = {
        border = 'rounded',
      },
    }
    function _lazygit_toggle()
      lazygit:toggle()
    end

    vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })

    -- Map <Esc> to send an actual Escape key to the terminal in Terminal Mode
    vim.api.nvim_set_keymap('t', '<Esc>', '<Esc>', { noremap = true })
  end,
}
