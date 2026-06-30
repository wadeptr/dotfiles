vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic" })

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.opt.ttimeoutlen = 200
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.autoindent = true
vim.opt.smartindent = false
vim.opt.cindent = false
vim.keymap.set("n", "<M-h>", "<C-w>h", { desc = "Focus left window" })
vim.keymap.set("n", "<M-j>", "<C-w>j", { desc = "Focus lower window" })
vim.keymap.set("n", "<M-k>", "<C-w>k", { desc = "Focus upper window" })
vim.keymap.set("n", "<M-l>", "<C-w>l", { desc = "Focus right window" })

local function open_terminal_bottom()
  local height = math.max(8, math.floor(vim.o.lines * 0.3))
  vim.cmd("botright " .. height .. "split | terminal")
  vim.w.terminal_split_direction = "bottom"
  vim.cmd("startinsert")
end

local function open_terminal_right()
  local width = math.max(30, math.floor(vim.o.columns * 0.3))
  vim.cmd("botright " .. width .. "vsplit | terminal")
  vim.w.terminal_split_direction = "right"
  vim.cmd("startinsert")
end

vim.keymap.set("n", "<leader>tb", open_terminal_bottom, { desc = "Open bottom terminal split" })
vim.keymap.set("n", "<leader>tr", open_terminal_right, { desc = "Open right terminal split" })

vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
  pattern = "term://*",
  callback = function()
    if vim.bo.buftype == "terminal" then
      vim.cmd("startinsert")
    end
  end,
})

local terminal_normal = [[<C-\><C-n>]]

vim.keymap.set("t", "<Esc><Esc>", terminal_normal, { desc = "Exit terminal mode" })
vim.keymap.set("t", "<C-g>", terminal_normal, { desc = "Exit terminal mode" })
vim.keymap.set("t", "<M-h>", terminal_normal .. "<C-w>h", { desc = "Focus left window" })
vim.keymap.set("t", "<M-j>", terminal_normal .. "<C-w>j", { desc = "Focus lower window" })
vim.keymap.set("t", "<M-k>", terminal_normal .. "<C-w>k", { desc = "Focus upper window" })
vim.keymap.set("t", "<M-l>", terminal_normal .. "<C-w>l", { desc = "Focus right window" })

