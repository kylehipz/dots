local gps = require('nvim-gps')

gps.setup()

require('lualine').setup({
  options = {
    theme = 'powerline_dark',
    section_separators = { left = '▶' },
    component_separators = { left = '▶' }
  },
  sections = {
    lualine_c = {
      { gps.get_location, cond = gps.is_available }
    }
  }
})
