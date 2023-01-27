(local M {})
(tset M :bookmarks {})
(fn M.goto_file []
  (let [ char (vim.fn.getcharstr)]
   (if (= char " ")
    (M.add_file (vim.fn.getcharstr))
    (= char "\t")
    (vim.notify (vim.inspect M.bookmarks))
    (= char "\x80kb")
    (tset M.bookmarks (vim.fn.getcharstr) nil)
    (vim.cmd.edit (. M.bookmarks char))
    )
   )
 )
(fn M.add_file [char]
  (let [file (vim.fn.expand "%:p")]
    (tset M.bookmarks char file)
    ))
M
