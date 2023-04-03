local lsp = require('lsp-zero').preset({
  manage_nvim_cmp = {
    set_sources = 'recommended'
  }
})

lsp.on_attach(function(client, bufnr)
  -- Based on defaults: 
  -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#default_keymapsopts
  -- (Modified a little bit)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references)
  vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help)

  vim.keymap.set('n', '<F1>', vim.lsp.buf.format)
  vim.keymap.set('n', '<F2>', vim.lsp.buf.rename)
  vim.keymap.set('n', '<F3>', vim.lsp.buf.code_action)

  vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
end)


-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

lsp.setup()

local cmp = require('cmp')

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true })
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})

