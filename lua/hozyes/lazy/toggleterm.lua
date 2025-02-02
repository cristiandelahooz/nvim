return {
  {
    'akinsho/toggleterm.nvim',
    tag = 'v2.13.1',
    config = function()
      require("toggleterm").setup{
        open_mapping = [[<c-\>]],  -- Tecla para alternar el terminal
        direction = "horizontal",  -- Abre el terminal abajo
      }
    end
  }
}
