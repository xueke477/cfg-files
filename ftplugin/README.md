# My Filetype Configurations

This directory contains filetype-specific configurations of Vim that I use often. The configuration files are Vim scripts (e.g. `FOO.vim`) from `~/.vim/ftplugin`. 

## Filetype Plugins

Filetype plugins are those Vim scripts loaded only for a specific file type. 

1. The names of the filetype plugin documents should be `<filetype>_foo.vim`. Or simply create a directory with the same name as `filetype` and put all the vim scripts in it. In the latter case the names of the vim scripts don't matter. For example, all the Python filetype plugins go into the directory `~/.vim/ftplugin/python` and TeX filetype plugins go into `~/.vim/ftplugin/tex`.

2. `<filetype>` is a bit subtle. It's not always the extension name. For example, for .py files, `<filetype>` is `python`; for .md files, `<filetype>` is `markdown`.

## Filetype Macros

There are currently two ways of defining insert-mode filetype macros. The first one uses only the Vim built-in macro functionality. The second uses the plugin [vim-macrobatics](https://github.com/svermeulen/vim-macrobatics).

1. Include `imap.vim` in the `filetype` directory. This script is copied from [vim-latex](http://vim-latex.sourceforge.net), mainly for its `JumpForward` function and placeholder `<++>`. The `IMAP` function is useful when the rhs is a one-line string, or the filetype doesn't involve complex auto-indentation. Otherwise more techniques need to be combined.

2. Copy `python.vim` from the `python` directory and rename it `filetype.vim`.

3. `inoremap` stands for *insert-mode non-recursive map*. That is, different insert-mode maps won't be combined automatically.

4. `imap <Tab> <Plug>IMAP_JumpForward` must be in the recursive mode. We should include this line in every `filetype.vim`, as we want to use Tab as the default JumpForward for all filetypes.

5. It looks like the remapping to hotkeys of 3rd-party plugins must be in the **recursive mode**. Besides the previous example, in `.vim/ftplugin/markdown/markdown.vim`, we have: `nmap <leader>ll <C-p>`.

6. Next we record and name a macro, and then define the key mapping in filetype.vim accordingly. There are two ways to do it.

7. Via the built-in macro functionality:

    * Record a macro in Vim following the standard procedure (see [Vim Fandom](https://vim.fandom.com/wiki/Macros)). These macros are automatically saved for all future Vim sessions. Note that the recorded macros **CANNOT end** in `<CR>` or `<NL>`.

    * Use the aforementioned macro as `@?` (`?` is the corresponding macro name) in `inoremmap` to define the insert-mode key mapping. Using the macro `@?` allows us to insert more complex, multi-line strings.

    * As an example, in `.vim/ftplugin/python/python.vim`, we have the following code:

        ```
        inoremap DOC """<Esc>@za
        ```

        When `DOC` is typed in insert mode, Vim first types `"""`, then enters normal mode and performs the macro `@z` and finally comes back into insert mode with the last action `a`.

    * Note that in this way there can be at most 26 macros for each filetype at any given moment, because Vim built-in macros can only be named by a single lowercase letter.

8. Via vim-macrobatics:

    * In normal mode, hit `<leader>rm`, then start recording the macro as in 7. After recording, hit `<Esc>` and then `<leader>rm` to finish recording. (These hotkeys are my personal preference and are defined in my `.vimrc`.)

    * Still in normal mode, hit `<leader>nm` and name the macro in the Vim prompt. The naming convention is `filetype.FOO`, where `FOO` represents the keys that invoke the macro.

    * In `filetype.vim`, insert the following code:

        ```
        inoremap FOO :call macrobatics#playNamedMacro('filetype.FOO')<cr>
        ```

    * As an example, in `.vim/ftplugin/python/python.vim`, we have 

        ```
        inoremap DOC """<Esc>:call macrobatics#playNamedMacro('python.DOC')<cr>
        ```

        The first three double quotes are due to the auto-indentation of [python-mode](https://github.com/python-mode/python-mode). They are used to pin the starting point of the macro at the place of the cursor right before we type DOC in the insert mode. The macro `python.DOC` are all the rest of steps following the three double quotes (This macro is for Python docstring). If the filetype has no auto-indentation, the leading characters are not necessary. Note that this type of macros end in normal mode due to the specific implementation of `playNamedMacro()`. There is currently no way to end in insert mode as in the first method without modifying the underlying vim script.
