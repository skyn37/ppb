vim.g.mapleader = " "

-- netrw 
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.api.nvim_set_keymap('x', '<leader>[[', '"*y', { noremap = true, silent = true }) -- set copy to clipboard

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
vim.opt.number = true -- line numbers
vim.opt.relativenumber = true -- relative line numbers
-- Set filetype for GLSL files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.fs", "*.vs" },
    callback = function()
        vim.bo.filetype = "glsl"
    end,
})

-- Run prettier on the current file
vim.api.nvim_set_keymap(
    "n",
    "<leader>pv",
    ":silent !npx prettier --write %<CR> | edit!<CR>",
    { noremap = true, silent = true }
)
-- arrow keys now move between windows
vim.api.nvim_set_keymap("n", "<Up>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Down>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Left>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Right>", "<C-w>l", { noremap = true, silent = true })
