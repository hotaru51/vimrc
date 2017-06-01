"フォント設定
if has('win32')
  set guifont=Migu\ 1M:h11:cSHIFTJIS
elseif has('mac')
  set guifont=Osaka-mono:h16
else "Linux
endif

"カラースキーム
colorscheme molokai

"幅、高さ
set columns=130
set lines=35
