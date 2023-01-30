(local M {})
(tset M :visited_files {})
(fn M.open_file [file]
  (vim.cmd.edit file)
  )
(fn M.lock_file [key]
  (let [dict (. M.visited_files key)]
    (if (> (length dict) 1)
     (vim.ui.select dict {} #(tset dict :lock $1))
     (tset dict :lock (. dict 1))
     )))
(fn M.unlock_file [key]
  (tset (. M.visited_files key) :lock nil)
  )
(fn M.goto_file [key]
  (let [dict (. M.visited_files key)]
    (if dict
        (match (length dict)
          0 nil
          1 (M.open_file (. dict 1))
          _ (if (. dict :lock)
                (M.open_file (. dict :lock))
                (vim.ui.select dict {} M.open_file)
                )))))
(fn M.add_file []
  (let [
        filename (vim.fn.expand "%:t")
        filepath (vim.fn.expand "%:p")
        ]
    (when (and (~= filename "") (= (vim.fn.match filepath "^[A-Za-z0-9]*://") -1))
      (let [
            key (: filename :sub 1 1)
            dict (. M.visited_files key)
            ]
        (if (not dict)
            (tset M.visited_files (: filename :sub 1 1) [filepath])
            (if (and (not (vim.tbl_contains dict filepath) ) (= (vim.fn.isdirectory filepath) 0))
                (table.insert (. M.visited_files key) filepath)
                ))))))
(fn M.run []
 (match (vim.fn.getcharstr)
  "\t" (M.lock_file (vim.fn.getcharstr))
  "\x80kB" (M.unlock_file (vim.fn.getcharstr))
  "\r" (vim.notify (vim.inspect M.visited_files))
  char (M.goto_file char)
  ))
(fn M.setup []
  (vim.api.nvim_create_autocmd "FileType" {:pattern "*" :callback M.add_file})
  )
M
