local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- BUFFERS
map('n', '<Leader>a', ':bprevious<CR>', opts)
map('n', '<Leader>e', ':bnext<CR>', opts)
map('n', '<Leader>c', ':bd<CR>', opts)
map('n', '<Leader>q', ':bufdo bd<CR>', opts)

-- PANES
map('n', '<C-h>', '<C-W><C-H>', opts)
map('n', '<C-J>', '<C-W><C-J>', opts)
map('n', '<C-K>', '<C-W><C-K>', opts)
map('n', '<C-L>', '<C-W><C-L>', opts)

-- cursor doesn't move
map('n', 'J', 'mzJ`z', opts)
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)

-- Better undo
map('i', ',', ',<C-g>u', opts)
map('i', '.', '.<C-g>u', opts)
map('i', '[', '[<C-g>u', opts)
map('i', '!', '!<C-g>u', opts)
map('i', '?', '?<C-g>u', opts)

