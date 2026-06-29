local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
  return
end

nvim_tree.setup({
  disable_netrw = false,
  hijack_netrw = false,
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 32,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

local function resize_terminal_splits()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local bufnr = vim.api.nvim_win_get_buf(win)
    if vim.bo[bufnr].buftype == "terminal" then
      local ok, direction = pcall(vim.api.nvim_win_get_var, win, "terminal_split_direction")

      if ok and direction == "bottom" then
        vim.api.nvim_win_set_height(win, math.max(8, math.floor(vim.o.lines * 0.3)))
      else
        vim.api.nvim_win_set_width(win, math.max(30, math.floor(vim.o.columns * 0.3)))
      end
    end
  end
end
vim.keymap.set("n", "<leader>f", function()
  vim.cmd.NvimTreeToggle()
  vim.schedule(resize_terminal_splits)
end, { desc = "Toggle file tree" })
vim.keymap.set("n", "<leader>F", vim.cmd.NvimTreeFindFile, { desc = "Find current file in tree" })
