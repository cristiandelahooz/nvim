--theprimeagen

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

--vim.opt.colorcolumn = "80"

--My own
vim.o.timeout = true       -- Habilita el tiempo de espera
vim.o.timeoutlen = 300 -- Reduce el tiempo de espera a 200 ms (ajústalo según tu preferencia)
vim.o.ttimeoutlen = 0     -- Tiempo de espera para secuencias de escape
vim.o.guifont = "JetBrainsMono Nerd Font Mono:h12"
