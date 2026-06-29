require('blink.cmp').setup({
  -- use friendly snippets
  snippets = { preset = 'default' },

  -- appearance
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'mono',
  },

  -- keymaps
  keymap = {
    preset = 'default',
    ['<C-CR>'] = { 'accept', 'fallback' },
    ['<C-Enter>'] = { 'accept', 'fallback' },
  },

  -- sources
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  -- enable signature help / function params
  signature = { enabled = true },

  -- completion menu behavior
  completion = {
    menu = { auto_show = true },
    documentation = { auto_show = true },
  },
})
