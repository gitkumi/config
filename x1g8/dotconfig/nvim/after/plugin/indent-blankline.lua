vim.opt.list = true
vim.opt.listchars:append "eol:↴"

vim.cmd [[highlight IndentBlanklineIndent guifg=#3D3F49 gui=nocombine]]

require("indent_blankline").setup {
  show_end_of_line = true,
  char_highlight_list = {
      "IndentBlanklineIndent",
  },
  -- space_char_blankline = " ",
  space_char_highlight_list = {
      "IndentBlanklineIndent",
  },
}
