-- List of favorite files/marks per project
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

        keymap.set("n", "<leader>j", function() ui.nav_file(1) end)
        keymap.set("n", "<leader>k", function() ui.nav_file(2) end)
        keymap.set("n", "<leader>l", function() ui.nav_file(3) end)
    end
}
