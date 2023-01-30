local M = {}
M["visited_files"] = {}
M.open_file = function(file)
  return vim.cmd.edit(file)
end
M.lock_file = function(key)
  local dict = M.visited_files[key]
  if (#dict > 1) then
    local function _1_(_241)
      dict["lock"] = _241
      return nil
    end
    return vim.ui.select(dict, {}, _1_)
  else
    dict["lock"] = dict[1]
    return nil
  end
end
M.unlock_file = function(key)
  M.visited_files[key]["lock"] = nil
  return nil
end
M.goto_file = function(key)
  local dict = M.visited_files[key]
  if dict then
    local _3_ = #dict
    if (_3_ == 0) then
      return nil
    elseif (_3_ == 1) then
      return M.open_file(dict[1])
    elseif true then
      local _ = _3_
      if dict.lock then
        return M.open_file(dict.lock)
      else
        return vim.ui.select(dict, {}, M.open_file)
      end
    else
      return nil
    end
  else
    return nil
  end
end
M.add_file = function()
  local filename = vim.fn.expand("%:t")
  local filepath = vim.fn.expand("%:p")
  if ((filename ~= "") and (vim.fn.match(filepath, "^[A-Za-z0-9]*://") == -1)) then
    local key = filename:sub(1, 1)
    local dict = M.visited_files[key]
    if not dict then
      M.visited_files[filename:sub(1, 1)] = {filepath}
      return nil
    else
      if (not vim.tbl_contains(dict, filepath) and (vim.fn.isdirectory(filepath) == 0)) then
        return table.insert(M.visited_files[key], filepath)
      else
        return nil
      end
    end
  else
    return nil
  end
end
M.run = function()
  local _10_ = vim.fn.getcharstr()
  if (_10_ == "\9") then
    return M.lock_file(vim.fn.getcharstr())
  elseif (_10_ == "\128kB") then
    return M.unlock_file(vim.fn.getcharstr())
  elseif (_10_ == "\13") then
    return vim.notify(vim.inspect(M.visited_files))
  elseif (nil ~= _10_) then
    local char = _10_
    return M.goto_file(char)
  else
    return nil
  end
end
M.setup = function()
  return vim.api.nvim_create_autocmd("FileType", {pattern = "*", callback = M.add_file})
end
return M
