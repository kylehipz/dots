require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
    char = '|',
    buftype_exclude = {'terminal'},
    filetype_exclude = {'dashboard', 'packer'},
    show_end_of_line = true,
    context_patterns = {
      "class", "return", "function", "method", "^if", "^while", "jsx_element", "^for", "^object", "^table", "block",
      "else_clause", "jsx_self_closing_element", "try_statement", "catch_clause", "import_statement", "arguments", "if_statement",
      "operation_type"
    }
}
