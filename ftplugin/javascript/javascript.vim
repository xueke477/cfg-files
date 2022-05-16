call IMAP("'", "'<++>'", 'javascript')
call IMAP('(', '(<++>)', 'javascript')
call IMAP('[', '[<++>]', 'javascript')
call IMAP('{', '{<++>}', 'javascript')
call IMAP('"', '"<++>"', 'javascript')

"the remapping for JumpForward must use imap, the recursive mode.
imap <tab> <Plug>IMAP_JumpForward
nmap <Tab> <Plug>IMAP_JumpForward

"set a color column
set colorcolumn=100
