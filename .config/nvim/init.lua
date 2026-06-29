require("bwade")
require("vim._core.ui2").enable({})

vim.filetype.add({ extension = { astro = "astro" } })

vim.lsp.enable('luals')
vim.lsp.enable('zuban')
vim.lsp.enable('astro')
vim.lsp.enable('rust_analyzer')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end
    if client.name == 'rust_analyzer' then
      client.handlers['$/progress'] = function(_, result, ctx)
        vim.lsp.handlers['$/progress'](_, result, ctx)
        if result.value and result.value.kind == 'end' then
          vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
        end
      end
    else
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})
