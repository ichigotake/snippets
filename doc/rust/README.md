# rust

## Setup

本体は [rust-lang.org](http://www.rust-lang.org/) からダウンロードする

### vimrc

```
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'phildawes/racer', {
    \   'build' : {
    \     'mac'  : 'cargo build --release',
    \     'unix' : 'cargo build --release',
    \   },
    \   'autoload' : {
    \       'filetypes' : 'rust',
    \   },
    \ }
NeoBundle 'rhysd/rust-doc.vim'

" racer の設定
" https://github.com/phildawes/racer
" 
" 前もって以下をやっておく
" TODO: 公式パッケージからインストールされたものがあるのか知りたい
" $ mkdir -p /usr/local/src && git clone git@github.com:rust-lang/rust.git /usr/local/src/rust
set hidden 
let g:racer_cmd='/Users/ichigotake/.vim/bundle/racer/target/release/racer'
let $RUST_SRC_PATH ='/usr/local/src/rust/src'

```

