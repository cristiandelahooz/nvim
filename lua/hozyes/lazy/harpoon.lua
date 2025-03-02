return {
    -- https://github.com/ThePrimeagen/harpoon
    'ThePrimeagen/harpoon',
    branch = 'master',
    event = 'VeryLazy',
    dependencies = {
        -- https://github.com/nvim-lua/plenary.nvim
        'nvim-lua/plenary.nvim',
    },
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")
        local keymap = vim.keymap
        keymap.set("n", "<leader>a", mark.add_file)
        keymap.set("n", "<leader>E", ui.toggle_quick_menu)

        keymap.set("n", "<c-h>", function() ui.nav_file(1) end)
        keymap.set("n", "<c-j>", function() ui.nav_file(2) end)
        keymap.set("n", "<c-k>", function() ui.nav_file(3) end)
        keymap.set("n", "<c-l>", function() ui.nav_file(4) end)
    end
}
