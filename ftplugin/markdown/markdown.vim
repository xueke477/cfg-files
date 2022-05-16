call IMAP('(', '(<++>)', 'markdown')
call IMAP('[', '[<++>]', 'markdown')
call IMAP('{', '{<++>}', 'markdown')
call IMAP('`', '`<++>`', 'markdown')
call IMAP('*', '*<++>*', 'markdown')
call IMAP('"', '"<++>"', 'markdown')
call IMAP('CBL', "```\<cr><++>\<cr>```\<cr><++>", 'markdown')

"the remapping for JumpForward must use imap, the recursive mode.
imap <Tab> <Plug>IMAP_JumpForward
nmap <Tab> <Plug>IMAP_JumpForward

nmap <leader>ll :silent! call Vim_Markdown_Preview_myown()<CR>


function! Vim_Markdown_Preview_myown()
  let b:curr_file = expand('%:p')
  call system('cat "' . b:curr_file . '" | /usr/bin/python3 -m marko > /Users/kxue/Dropbox/html/myown-markdown.html')
  execute '!/usr/bin/python3 /Users/kxue/Dropbox/html/render_github_markdown.py'
  call system('open -a Safari /Users/kxue/Dropbox/html/today_preview.html')
endfunction

"set a color column
set colorcolumn=120
