-- File Explorer / Tree
return {
  -- https://github.com/nvim-tree/nvim-tree.lua
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    -- https://github.com/nvim-tree/nvim-web-devicons
    'nvim-tree/nvim-web-devicons', -- Fancy icon support
  },
  opts = {
    actions = {
      open_file = {
        window_picker = {
          enable = false
        },
      }
    },
    on_attach = function(bufnr)
      local api = require "nvim-tree.api"

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- Default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- Custom mappings
      vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
      vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))

      -- Open folder on moving right
      vim.keymap.set('n', 'l', function()
        local node = api.tree.get_node_under_cursor()
        if node and node.type == "directory" and not node.open then
          api.node.open.edit()
        else
          vim.cmd("normal! l")
        end
      end, opts('Open Folder or Move Right'))

      -- Close folder on moving left
      vim.keymap.set('n', 'h', function()
        local node = api.tree.get_node_under_cursor()
        if node and node.type == "directory" and node.open then
          api.node.open.edit()
        else
          vim.cmd("normal! h")
        end
      end, opts('Close Folder or Move Left'))
    end,
  },
  config = function (_, opts)
    -- Recommended settings to disable default netrw file explorer
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.keymap.set("n", "<leader>w", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
    require("nvim-tree").setup(opts)
  end
}
