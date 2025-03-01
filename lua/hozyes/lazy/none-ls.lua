return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")
    local nls = null_ls.builtins

    -- Configuración de fuentes
    local sources = {
      nls.formatting.google_java_format.with({
        filetypes = { "java" },
      }),
    }

    -- Configuración de null-ls
    null_ls.setup({
      sources = sources,
    })
  end,
}
