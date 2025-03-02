return {
    "folke/trouble.nvim",
    opts = {
        modes = {
            diagnostics = {
                focus =true,
                pinned = true,
            },
        },
    },
    cmd = "Trouble",
    keys = {
        { "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>" },
    },
}
