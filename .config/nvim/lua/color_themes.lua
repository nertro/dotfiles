local lsp_status = require('lsp-status')
local util = require("tokyonight.util")
-- completion_customize_lsp_label as used in completion-nvim
-- Optional: customize the kind labels used in identifying the current function.
-- g:completion_customize_lsp_label is a dict mapping from LSP symbol kind
-- to the string you want to display as a label
-- lsp_status.config { kind_labels = vim.g.completion_customize_lsp_label }

-- Register the progress handler
lsp_status.register_progress()

require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help", "terminal" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = true, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors)
    colors.comment = util.lighten(colors.comment, 0.89)
    bg_dark = colors.bg_dark
    colors.bg_dark = colors.bg
    colors.bg = bg_dark
    colors.fg = util.blend(colors.fg, colors.magenta, 0.4)
  end,
    -- bg_dark = "#1e2030", --
    -- bg = "#222436", --
    -- bg_highlight = "#2f334d", --
    -- terminal_black = "#444a73", --
    -- fg = "#c8d3f5", --
    -- fg_dark = "#828bb8", --
    -- fg_gutter = "#3b4261",
    -- dark3 = "#545c7e",
    -- comment = "#7a88cf", --
    -- dark5 = "#737aa2",
    -- blue0 = "#3e68d7", --
    -- blue = "#82aaff", --
    -- cyan = "#86e1fc", --
    -- blue1 = "#65bcff", --
    -- blue2 = "#0db9d7",
    -- blue5 = "#89ddff",
    -- blue6 = "#b4f9f8", --
    -- blue7 = "#394b70",
    -- purple = "#fca7ea", --
    -- magenta2 = "#ff007c",
    -- magenta = "#c099ff", --
    -- orange = "#ff966c", --
    -- yellow = "#ffc777", --
    -- green = "#c3e88d", --
    -- green1 = "#4fd6be", --
    -- green2 = "#41a6b5",
    -- teal = "#4fd6be", --
    -- red = "#ff757f", --
    -- red1 = "#c53b53", --
  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
})

require('lualine').setup{
  options = {
    theme = 'tokyonight'
  },
  sections = {
    lualine_a = {'filename'},
    lualine_b = {'FugitiveHead', 'diff'},
    lualine_c = {'diagnostics'},
    lualine_x = { 'lan_server', 'data', "require'lsp-status'.status()" },
    lualine_y = {'buffers'},
    lualine_z = {'location', 'progress'}
  }
}

vim.cmd[[colorscheme tokyonight]]
-- vim.cmd[[colorscheme bloop]]
-- vim.cmd([[
-- set completeopt=menu,menuone,noselect
-- " gray
-- highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
-- " blue
-- highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
-- highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
-- " light blue
-- highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
-- highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
-- highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
-- " pink
-- highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
-- highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
-- " front
-- highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
-- highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
-- highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
-- ]])
