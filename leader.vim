let mapleader = "\<Space>"

" バッファに変更点があるときのみ書き込みを行う。
noremap <Leader>w :update<CR>

nmap <Leader><Leader> <C-w>w

" 0（ゼロ）レジスタで同じ文字列を何度も貼り付ける
"" y でヤンクした文字列をいろんな場所に貼り付けるということはよくあると思います。普通にいろんな場所に p で貼り付ければいいのですが、困るのが途中で編集をして関係ない文字列を削除してしまった時。せっかくヤンクした文字列が上書きされてしまって貼り付けられなくなってしまった。
"" 実はヤンクされた文字列は 0 というレジスタにも自動的に入ります。そして、削除などでは 0 レジスタは使われません。
"" http://cohama.hateblo.jp/entry/20130108/1357664352
noremap <Leader>0 "0p

" システムのクリップボードとのコピー＆ペースト
"" コピー
vmap <Leader>y "+y
"" 切り取り
vmap <Leader>d "+d
"" ペースト（ノーマルモード）（大文字小文字はペースト開始位置の違い（たぶん）
nmap <Leader>p "+p
nmap <Leader>P "+P
"" ペースト（ビジュアルモード）
vmap <Leader>p "+p
vmap <Leader>P "+P

" QuickFix
noremap <Leader>qq :cclose<CR>
noremap <Leader>qo :copen<CR>

" バッファ一覧（'jlanzarotta/bufexplorer'）
noremap <Leader>b :BufExplorer<CR>

" 開いているファイルをNERDTreeで表示
noremap <Leader>t :NERDTreeFind<CR>

" カーソル位置の単語でgrep
"" tpope/vim-fugitive
noremap <Leader>gg :Ggrep <C-r><C-w><CR>
"" rking/ag.vim
noremap <Leader>ag :Ag <C-r><C-w><CR>
"" nazo/pt.vim
noremap <Leader>pt :Pt <C-r><C-w><CR>

" Gitで変更があるファイルをすべてバッファに入れる
function! EditGitModifiedFiles()
  :NERDTreeClose
  for f in systemlist('git diff --name-only HEAD')
    if bufnr(f) == -1
      execute 'edit ' . f
    end
  endfor
endfunction
noremap <Leader>eg :call EditGitModifiedFiles()<CR>
noremap <silent> <Leader>ge :call EditGitModifiedFiles()<CR>:BufExplorer<CR>

" operator-camelize.vim
map <leader>cc <plug>(operator-camelize)
map <leader>cs <plug>(operator-decamelize)

" kana/vim-altr
nmap <Leader>a  <Plug>(altr-forward)

" AndrewRadev/sideways.vim
" to move function arguments (and other delimited-by-something items) left and right.
nnoremap <Leader>hh :SidewaysLeft<CR>
nnoremap <Leader>ll :SidewaysRight<CR>
