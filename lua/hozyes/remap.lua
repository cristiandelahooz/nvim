vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "qj", "<Esc>:w<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- [[ Tab management ]]
vim.keymap.set("n", "<leader>to", ":tabnew<CR>")   -- open a new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close a tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>")     -- next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>")     -- previous tab

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- [[ Navigate panes better ]]
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- [[ Java ]]
vim.keymap.set('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', '<leader>gg', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>')

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

local function set_keymaps_for_ft()
    local ft = vim.bo.filetype

    if ft == "java" then
        -- Manejo de excepciones en Java
        vim.keymap.set("n", "<leader>ee",
            "otry {<CR>} catch (Exception e) {<CR>throw new RuntimeException(e);<CR>}<Esc>O", { buffer = true })
        vim.keymap.set("n", "<leader>el",
            "otry {<CR>} catch (Exception e) {<CR>logger.severe(\"Error: \" + e.getMessage());<CR>}<Esc>O",
            { buffer = true })
        vim.keymap.set("n", "<leader>ea", "oassert condition : \"Error: \" + e.getMessage();<Esc>F\";a",
            { buffer = true })
        vim.keymap.set("n", "<leader>ef",
            "otry {<CR>} catch (Exception e) {<CR>System.err.println(\"Error: \" + e.getMessage());<CR>}<Esc>O",
            { buffer = true })
    elseif ft == "go" then
        -- Manejo de errores en Go
        vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>", { buffer = true })
        vim.keymap.set("n", "<leader>ea", "oassert.NoError(err, \"\")<Esc>F\";a", { buffer = true })
        vim.keymap.set("n", "<leader>ef", "oif err != nil {<CR>}<Esc>Olog.Fatalf(\"error: %s\\n\", err.Error())<Esc>jj",
            { buffer = true })
        vim.keymap.set("n", "<leader>el", "oif err != nil {<CR>}<Esc>O.logger.Error(\"error\", \"error\", err)<Esc>F.;i",
            { buffer = true })
    end
end

-- Execute when open a buffer
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = set_keymaps_for_ft
})

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- [[ RUN ]]
function RunCurrentFile()
    local filetype = vim.bo.filetype
    local filename = vim.fn.expand("%")
    local output_file = "output"

    local commands = {
        javascript = "node " .. filename,
        typescript = "tsx " .. filename,
        c = "gcc " .. filename .. " -o " .. output_file .. " && ./" .. output_file .. " && rm " .. output_file,
        go = "go run " .. filename,
        zsh = "./" .. filename,
        bash = "./" .. filename,
        haskell = "ghc " .. filename .. " -o " .. output_file .. "&& ./" .. output_file .. "&& rm ./*{.o,.hi,output}",
        java = "gd run"
    }

    if commands[filetype] then
        vim.cmd(":term " .. commands[filetype]) -- Run program
    else
        print("No execution command set for filetype: " .. filetype)
    end
end

vim.api.nvim_set_keymap("n", "<leader>r", ":lua RunCurrentFile()<CR>", { noremap = true, silent = true })
