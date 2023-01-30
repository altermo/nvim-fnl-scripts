Some of my fennel based scripts for neovim.

**!important: the documentation is not updated regularly, so it may be inaccurate.**

**!important: some of the scripts require external plugins to be installed.**
# The scripts
## auto-save.fnl
Auto-saves after every `InsertLeave` and `TextChanged`
## bookend.fnl
Temporary bookmarks
Keymap after running `M.goto_file`
| key       | action                                                |
|-----------|-------------------------------------------------------|
| \<escape> | don't do anything                                     |
| \<space>  | sets current file bookmark to next pressed character  |
| \<bs>     | removes the next pressed character from the bookmarks |
| other     | goto that bookmark                                    |
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
