local parsers = {
  "javascript", "typescript", "tsx", "c", "lua", "rust", "python",
  "vim", "vimdoc", "query", "markdown", "markdown_inline", "astro"
}

local filetypes = {
  "javascript", "typescript", "typescriptreact", "c", "lua", "rust", "python",
  "vim", "vimdoc", "query", "markdown", "markdown_inline", "astro"
}

-- Install parsers
require("nvim-treesitter").install(parsers)

-- Enable highlighting
vim.api.nvim_create_autocmd("FileType", {
  pattern = filetypes,
  callback = function()
    vim.treesitter.start()
  end,
})

-- Better folding with treesitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
