set autoindent
set cindent
set shiftwidth=4
set expandtab

call IMAP("'", "'<++>'", 'c')
call IMAP('(', '(<++>)', 'c')
call IMAP('[', '[<++>]', 'c')
call IMAP('{', '{<++>}', 'c')
call IMAP('"', '"<++>"', 'c')

"the remapping for JumpForward must use imap, the recursive mode.
imap <Tab> <Plug>IMAP_JumpForward
nmap <Tab> <Plug>IMAP_JumpForward

