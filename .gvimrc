"フォント設定
if has('win32')
  set guifont=Migu\ 1M:h11:cSHIFTJIS
elseif has('mac')
  set guifont=Migu\ 1M:h15
else "Linux
  set guifont=Migu\ 1M
endif

"カラースキーム
colorscheme molokai

"幅、高さ
set columns=130
set lines=35
