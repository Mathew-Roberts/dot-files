-- Setting keymaps

-- Exiting Normal Mode
vim.keymap.set('i', 'jj', '<Esc>', { desc = 'Exiting Insert mode' })

--Get rid of highlighting after a search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- quickfix list
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'qf',
  callback = function()
    -- local opts = { buffer = true, noremap = true, silent = true }
    vim.keymap.set('n', '<C-n>', ':cnext<CR>')
    vim.keymap.set('n', '<C-p>', ':cprev<CR>')
    vim.keymap.set('n', '<Esc>', ':cclose<CR>')
  end,
})

-- basic list
vim.keymap.set('v', '<leader>x', ':lua<CR>', { desc = 'Source this particular snippet of code' })

-- vim: ts=2 sts=2 sw=2 et
