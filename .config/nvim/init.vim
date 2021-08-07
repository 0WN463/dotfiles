set number
set rnu
set showcmd
set shellcmdflag=-ic
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType python nnoremap <buffer>gc ma0i##<Esc>`all 
autocmd FileType python nnoremap <buffer>gC ma0df#<Esc>`ahh

cnoremap w!! execute 'silent! write !SUDO_ASKPASS=`which ssh-askpass` sudo tee % >/dev/null' <bar> edit!

nnoremap D "_d
nnoremap o o<Esc>
nnoremap O i<CR><Esc>
nnoremap Q @q 

nnoremap <C-Up> 5k
nnoremap <C-Down> 5j

nnoremap <Leader>r :e!<CR>
nnoremap <Leader>s :w<CR>
nnoremap <Leader>S :source ~/.config/nvim/init.vim<CR>
nnoremap <Leader>V :tabedit ~/.config/nvim/init.vim<CR>
nnoremap <Leader>d :exec Deuni()<CR>
nnoremap <Leader>n :.,$-1d<CR>
xnoremap <Leader>c c<C-R>=<C-R>"<CR><Esc>

vnoremap m c$<C-R>"<Left>$<Esc>
nnoremap <Space> i<Space><Esc>l

nnoremap m S$ 
nnoremap M ^i$<Esc>A$<Esc>
inoremap \fr<Space> \frac{}{}<Left><Left><Left>
inoremap \pp<Space> \frac{\partial }{\partial }<Esc>11hi
inoremap \al<Space> \begin{align*}<CR>\end{align*}<Up>
inoremap \ga<Space> \begin{gather*}<CR>\end{gather*}<Up>
inoremap \()<Space> \left(<Space><Space>\right)<Esc>7hi
inoremap \(<Space> \left(<Space>
inoremap \)<Space> \right)<Space>
inoremap \[]<Space> \left[<Space><Space>\right]<Esc>7hi
inoremap \[<Space> \left[<Space>
inoremap \]<Space> \right]<Space>

xnoremap <S-Down> dpV`]
xnoremap <S-Up> dkPV`]

functio! Deuni()
     :%s/\%u2206/\\Delta /ge 
     :%s/ G / $G$ /ge 
     :%s/\%u2265/\\geq /ge 
     :%s/\%u03b4/\\delta /ge 
     :%s/\%u2264/\\leq /ge
     :%s/\.\.\./\\cdots /ge
     :%s/\%u03b8/\\theta /ge
     :%s/\%u2208/\\in /ge
     :%s/\%u03c4/\\tau /ge
     :%s/\%u00b5/\\mu /ge
     :%s/\%u25e6/\\circ /ge
     :%s/\%u222a/\\cup /ge
     :%s/\%u03bb/\\lambda /ge
     :%s/\%u03ba/\\kappa /ge
     :%s/\%u03d5/\\varphi /ge
     :%s/\%u03b2/\\beta /ge
     :%s/\%u03c7/\\chi /ge
     :%s/\%u2212/-/ge  
     call feedkeys("``")
endfunction

source $HOME/.config/nvim/vim-plug/plugins.vim
