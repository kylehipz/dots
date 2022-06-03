vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        virtual_text = {
            spacing = 5,
            severity_limit = 'Warning',
        },
        update_in_insert = true,
    }
)

require'nvim-treesitter.configs'.setup {
  ensure_installed = {"html", "javascript", "lua", "go"},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true
  },
  autotag = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  autopairs = {
    enable = true
  },
  indent = {
    enable = false
  },
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim 
      lookahead = true,
      keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner"
      }
    },
    move = {
      enable = true,
      set_jumps = true, 
      goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer'
      },
      goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer'
      },
      goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer'
      },
      goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer'
      }
    }
  }
}
