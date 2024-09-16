return {
  'akinsho/git-conflict.nvim',
  version = 'v2.0.0',
  config = function()
    require('git-conflict').setup {
      disable_diagnostics = true,
    }
  end,
}
