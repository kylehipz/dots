local gps = require('nvim-gps')

gps.setup()

require('lualine').setup({
  options = {
    theme = 'auto',
  },
  sections = {
    lualine_c = {
      { gps.get_location, cond = gps.is_available }
    }
  }
})
