return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Biome como formateador
        null_ls.builtins.formatting.biome,
        --java formatter
        null_ls.builtins.formatting.google_java_format,
      },
    })
  end,
}
