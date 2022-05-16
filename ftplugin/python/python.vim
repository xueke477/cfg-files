call IMAP("'", "'<++>'", 'python')
call IMAP('(', '(<++>)', 'python')
call IMAP('[', '[<++>]', 'python')
call IMAP('{', '{<++>}', 'python')
call IMAP('"', '"<++>"', 'python')
call IMAP('DOC', "\"\"\"\<cr><++>\<cr>\"\"\"\<cr>", 'python')
call IMAP('MDS', "if __name__ == '__main__':<++>", 'python')
call IMAP('PDP', "file_dir = Path(__file__)\<cr><++> = file_dir.joinpath(<++>)\<cr>", 'python')

"the remapping for JumpForward must use imap, the recursive mode.
imap <Tab> <Plug>IMAP_JumpForward
nmap <Tab> <Plug>IMAP_JumpForward

"set a color column
set colorcolumn=80
