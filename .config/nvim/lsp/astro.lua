local global_ts = vim.fn.trim(vim.fn.system("npm root -g")) .. "/typescript/lib"

return {
  cmd = { "astro-ls", "--stdio" },
  filetypes = { "astro" },
  root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
  before_init = function(_, config)
    local root_dir = config.root_dir or vim.fn.getcwd()
    local local_ts = root_dir .. "/node_modules/typescript/lib"
    if vim.fn.isdirectory(local_ts) == 1 then
      config.init_options = { typescript = { tsdk = local_ts } }
    end
  end,
  init_options = {
    typescript = { tsdk = global_ts },
  },
}
