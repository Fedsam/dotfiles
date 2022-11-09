local g = vim.g
local o = vim.opt
local bo = vim.bo
local wo = vim.wo

g.mapleader = " "
g.title = true

o.mouse = 'a'
o.number = true
o.relativenumber = true

o.ignorecase = true
o.smartcase = true

o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2

o.swapfile = true
o.autowrite = true
o.autoread = true

o.lazyredraw = true
o.laststatus = 3

o.splitbelow = true
o.splitright = true

o.errorbells = true
o.visualbell = true

o.wildignore = '*/cache/*,*/tmp/*,*/node_modules/*'

bo.smartindent = true
wo.wrap = true

o.showmatch = true
o.mat = 2

o.termguicolors = true

-- set clipboard
local is_mac =  vim.fn.has("macunix") == 1

if is_mac then
  require('macos')
end
