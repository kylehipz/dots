vim.o.background = "dark" -- or "light" for light mode
local c = require('vscode.colors')
require('vscode').setup({
    -- Enable italic comment
    italic_comments = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
        vscLineNumber = '#FFFFFF',
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    }
})
vim.cmd([[colorscheme vscode]])
-- vim.g.rose_pine_variant = 'base'
-- vim.cmd([[colorscheme rose-pine]])
