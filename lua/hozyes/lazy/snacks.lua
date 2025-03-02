return {
  "folke/snacks.nvim",
  dependencies = {
    "echasnovski/mini.icons",
  },
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        header = [[
                                                                     
       ████ ██████           █████      ██                     
      ███████████             █████                             
      █████████ ███████████████████ ███   ███████████   
     █████████  ███    █████████████ █████ ██████████████   
    █████████ ██████████ █████████ █████ █████ ████ █████   
  ███████████ ███    ███ █████████ █████ █████ ████ █████  
 ██████  █████████████████████ ████ █████ █████ ████ ██████ 
        ]],
      },
    },
    input = { enabled = true },
    git = { enabled = true },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
        { "<leader>sf",       function() Snacks.scratch() end,       desc = "Toggle Scratch Buffer" },
        { "<leader><leader>", function() Snacks.picker.recent() end, desc = "Recent Files" },
        { "<leader>ps",       function() Snacks.picker.grep() end,   desc = "Grep Files" },
        { "<leader>pv",       function() Snacks.explorer() end,      desc = "Explorer" },
    }

}
