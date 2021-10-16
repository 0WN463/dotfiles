set number
set rnu
set showcmd
set shellcmdflag=-ic
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType python nnoremap <buffer>gc ma0i##<Esc>`all 
autocmd FileType python nnoremap <buffer>gC ma0df#<Esc>`ahh

nnoremap D "_d
nnoremap o o<Esc>
nnoremap O i<CR><Esc>
nnoremap Q @q 

nnoremap <C-Up> 5k
nnoremap <C-Down> 5j
nnoremap H ^
nnoremap L $

nnoremap <Leader>r :e!<CR>
nnoremap <Leader>s :w<CR>
nnoremap <Leader>S :source ~/.config/nvim/init.vim<CR>
nnoremap <Leader>V :tabedit ~/.config/nvim/init.vim<CR>
nnoremap <Leader>n :.,$-1d<CR>
xnoremap <Leader>c c<C-R>=<C-R>"<CR><Esc>
nnoremap <Leader>y :call system('xclip', @0)<C-R>

nnoremap <Space> i<Space><Esc>l

xnoremap <S-Down> dpV`]
xnoremap <S-Up> dkPV`]

source $HOME/.config/nvim/vim-plug/plugins.vim
