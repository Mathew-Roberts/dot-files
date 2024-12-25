local group = vim.api.nvim_create_augroup
local cmd = vim.api.nvim_create_autocmd

-- Command to autoset indentation based on filetype
-- Set indentation to 2 spaces
--
group('setIndent', { clear = true })
cmd('Filetype', {
  group = 'setIndent',
  pattern = { 'lua', 'markdown', 'md', 'yaml' },
  command = 'setlocal shiftwidth=2 tabstop=2',
})

cmd('Filetype', {
  group = 'setIndent',
  pattern = { 'python', 'rust', 'json' },
  command = 'setlocal shiftwidth=4 tabstop=4',
})
