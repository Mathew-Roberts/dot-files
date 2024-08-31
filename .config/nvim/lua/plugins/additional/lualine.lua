return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local function pythonpath_status()
      local pythonpath = vim.fn.getenv 'PYTHONPATH'
      if pythonpath ~= vim.NIL then
        return '🐍 PYTHONPATH'
      else
        return ''
      end
    end
    require('lualine').setup {
      options = {
        theme = 'dracula',
      },
      sections = {
        lualine_c = { { 'filename', path = 1 } },
        lualine_z = { 'location', pythonpath_status },
      },
    }
  end,
}
