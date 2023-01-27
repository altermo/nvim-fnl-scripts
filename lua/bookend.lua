local M = {}
M["bookmarks"] = {}
M.goto_file = function()
  local char = vim.fn.getcharstr()
  if (char == " ") then
    return M.add_file(vim.fn.getcharstr())
  else
    return vim.cmd.edit(M.bookmarks[char])
  end
end
M.add_file = function(char)
  local file = vim.fn.expand("%:p")
  do end (M.bookmarks)[char] = file
  return nil
end
return M
