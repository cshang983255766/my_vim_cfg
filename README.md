# my_vim_cfg
vim IDE config

ag快速搜索：

首先安装ag搜索工具， 输入如下命令：

sudo  apt-get   install    silversearcher-ag

接着在～/.vimrc中添加以下内容：
```
  " Set mapleader
  let mapleader = ","

  " for easy using sliver search
  nmap <leader>f :norm yiw<CR>:Ag! -t -Q "<C-R>""

  " Locate and return character "above" current cursor position.
  function! LookUpwards()
      let column_num = virtcol('.')
      let target_pattern = '\%' . column_num . 'v.'
      let target_line_num = search(target_pattern . '*\S', 'bnW')


      if !target_line_num
          return ""
      else
          return matchstr(getline(target_line_num), target_pattern)
      endif
  endfunction

  imap <silent> <C-Y> <C-R><C-R>=LookUpwards()<CR>
```

注意：我的<leader>是“,”

使用方法： ",f" 唤醒，默认是当前路径，可以在命令行中增加路径

