vim.opt.number = true
vim.opt.rnu = true
vim.opt.showcmd = true
vim.opt.shellcmdflag = "-ic"

vim.keymap.set('n', 'D', '"_d')
vim.keymap.set('n', 'o', 'o<Esc>')
vim.keymap.set('n', 'O', 'i<CR><Esc>')
vim.keymap.set('n', 'Q', '@q ')
vim.keymap.set('n', '<Space>', 'i<Space><Esc>l')

vim.keymap.set({'n', 'x'}, 'H', '^')
vim.keymap.set({'n', 'x'}, 'L', '$')

vim.keymap.set('i', 'jk', '<Esc>')

-- reload
vim.keymap.set('n', '<Leader>r', ':e!<CR>')
-- save
vim.keymap.set('n', '<Leader>s', ':w<CR>')

vim.keymap.set('n', '<Leader>S', ':source $HOME/.config/nvim/init.lua<CR>')
vim.keymap.set('n', '<Leader>V', ':tabedit $HOME/.config/nvim/init.lua<CR>')

-- delete all below lines
vim.keymap.set('n', '<Leader>n', ':.,$-1d<CR>')
vim.keymap.set('n', '<Leader>y', '"+y')

-- replace selection with computed arithmetic value
vim.keymap.set('x', '<Leader>c', 'c<C-R>=<C-R>"<CR><Esc>')

-- shift selection up/down
vim.keymap.set('x', '<C-J>', 'dpV`]')
vim.keymap.set('x', '<C-K>', 'dkPV`]')

vim.cmd("source $HOME/.config/nvim/vim-plug/plugins.vim")
vim.cmd("colorscheme wal")

vim.api.nvim_create_autocmd(
    "FileType", { pattern = "python",
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.expandtab = true
    end
})

