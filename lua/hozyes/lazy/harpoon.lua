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

        keymap.set("n", "<M-h>", function() ui.nav_file(1) end)
        keymap.set("n", "<M-j>", function() ui.nav_file(2) end)
        keymap.set("n", "<M-k>", function() ui.nav_file(3) end)
        keymap.set("n", "<M-l>", function() ui.nav_file(4) end)
    end
}
