vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.ru = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.si = true -- Smart indent
vim.opt.ai = true -- Auto indent

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.g.netrw_browse_split = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 25
vim.g.netrw_banner = 0


vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.path:append { '**' }
vim.opt.wildignore:append { '*/node_modules/*', 'dist', 'build', 'target', '*.class', '*.o', '*.obj', '*.out' }
vim.opt.formatoptions:append { 'r' }

vim.opt.updatetime = 50

vim.opt.colorcolumn = "100"

vim.o.timeout = true   -- Habilita el tiempo de espera
vim.o.timeoutlen = 300 -- Reduce el tiempo de espera a 200 ms (ajústalo según tu preferencia)
vim.o.ttimeoutlen = 0  -- Tiempo de espera para secuencias de escape
