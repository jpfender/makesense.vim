Vim syntax highlighting for the makeSense language as used by the
[makeSense project](http://project-makesense.eu/)

Installation
-----------

* Drop makesense.vim into $HOME/.vim/syntax/makesense.vim (you may need
  to create this path)
* Edit $HOME/.vim/filetype.vim (you may need to create this file) by
  adding:
  
  	au BufRead,BufNewFile *.mpl setfiletype makesense
