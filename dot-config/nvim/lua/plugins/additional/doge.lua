return {
  'kkoomen/vim-doge',
  config = function()
    -- Configure vim-doge
    vim.cmd [[
		    let g:doge_enable = 1
		    let g:doge_doc_standard_python = 'numpy'
		    let g:doge_mapping = '<leader>o'

		  ]]
    -- Optionally, set up a key mapping for generating docstrings
    vim.keymap.set('n', '<leader>o', ':DogeGenerate<CR>', { noremap = true, silent = true })
  end,
}
