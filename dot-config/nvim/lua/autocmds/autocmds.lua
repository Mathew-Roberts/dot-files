local group = vim.api.nvim_create_augroup
local cmd = vim.api.nvim_create_autocmd

-- Command to autoset indentation based on filetype
-- Set indentation to 2 spaces
--
group('setIndent', { clear = true })
cmd('Filetype', {
  group = 'setIndent',
  pattern = { 'lua', 'markdown', 'md', 'yaml' },
  command = 'setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab',
})

cmd('Filetype', {
  group = 'setIndent',
  pattern = { 'python', 'rust', 'json' },
  command = 'setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab',
})
