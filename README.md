Some of my fennel based scripts for neovim.

**!important: the documentation is not updated regularly, so it may be inaccurate.**

**!important: some of the scripts require external plugins to be installed.**
# The scripts
## auto-save.fnl
Auto-saves after every `InsertLeave` and `TextChanged`
## bookend.fnl
Auto adds beginning of file name as bookmarks.
If there are more than one file with the same bookmark then a select UI will allow you to choose one of theme, unless that bookmark is locked to a specific file.
| key      | action                    |
|----------|---------------------------|
| \<CR>    | List current files        |
| \<Tab>   | Lock a file to a bookmark |
| \<S-tab> | Unlock a bookmark         |
| other    | Open that bookmark        |
## builder.fnl
A singe key to run/build a file.
| key | action                         |
|-----|--------------------------------|
| F5  | runs the file using `AsyncRun` |
| F6  | sources the file inside neovim |
| F7  | runs the file in a new vsplit  |
| F8  | quickly add a builder          |
## dff.fnl
Uses a complex algorithm to create key combinations for files.
```
/lib   > l
/utils > u
main.c > mc
main.h > mh
```
## fcreate.fnl
Quickly add skeletons of code.
```python
def foo():
    print("Hello world!"|)
#>>> call add function skeleton
def foo():
    print("Hello world!"|)

def |():
```
## labull.fnl
Add beginning of symbol in list when newline.
```
+ foo|
>>> newline
+ foo
+ |
```
## neofnl.fnl
A small wrapper library to run fennel inside neovim.
## ranger.fnl
A small wrapper for ranger.
## session.fnl
One day I will start writing this script, one day.
## swapapos.fnl
Swap the characters `'` and `"` on the current line.
## tabbm.fnl
Use `:TabBufMove` to move current buffer to tab, takes the same argument as `:tabnext`.
## tabline.fnl
A simple tabline implementation.
## textobj.fnl
Get an text-object of the same character vertically or horizontally.
| key | action                            |
|-----|-----------------------------------|
| im  | get same character/word in column |
| ik  | get same character inside line    |
```
abc
|123|
123
123
abc
>>im
abc
|123|
|123|
|123|
abc
```
```
ccaa|a|aaabb
>> ik
cc|aaaaaa|bb
```
## unimpaired.fnl
A rewrite for some of the functionality in unimpaired.vim
