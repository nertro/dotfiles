vim.cmd[[colorscheme tokyonight]]
vim.g.tokyonight_style = "night"
require('lualine').setup{
  options = {
    theme = 'tokyonight'
  },
  sections = {
    lualine_y = {'buffer'}
  }
}

