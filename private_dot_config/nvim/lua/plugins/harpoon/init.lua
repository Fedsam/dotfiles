local harpoonUI = require('harpoon.ui')

require('harpoon').setup({
  menu = {
    width = vim.api.nvim_win_get_width(0) - vim.api.nvim_win_get_width(0) * 0.60
  }
})

vim.keymap.set('n', '<leader>ha', require('harpoon.mark').add_file )
vim.keymap.set('n', '<leader>ht', harpoonUI.toggle_quick_menu )
vim.keymap.set('n', '<leader>hp', harpoonUI.nav_prev )
vim.keymap.set('n', '<leader>hn', harpoonUI.nav_next )
