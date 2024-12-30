return {
  'andrewferrier/debugprint.nvim',
  dependencies = {
    'echasnovski/mini.nvim', -- Needed for :ToggleCommentDebugPrints (not needed for NeoVim 0.10+)
  },
  opts = {
    keymaps = {
      normal = {
        plain_below = '<leader>dp',
        plain_above = '<leader>dP',
        variable_below = '<leader>dv',
        variable_above = '<leader>dV',

        -- misc
        delete_debug_prints = '<leader>dd',
        toggle_comment_debug_prints = '<leader>dt',
        reset_debug_prints_counter = '<leader>dr',
      },
      visual = {
        variable_below = '<leader>dv',
        variable_above = '<leader>dV',
      },
    },
  },
  version = '*', -- Remove if you DON'T want to use the stable version
}
