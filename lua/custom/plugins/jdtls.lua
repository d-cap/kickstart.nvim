vim.pack.add({
  { src = 'https://github.com/mfussenegger/nvim-jdtls' },
})

local function create_test_file()
  local path = vim.fn.expand('%:p')
  local test_path = path:gsub('/src/main/java/', '/src/test/java/')
  local class_name = vim.fn.expand('%:t:r')
  test_path = test_path:gsub(class_name .. '%.java$', class_name .. 'Test.java')

  if path == test_path then
    print('Not inside src/main/java, cannot map to test dir')
    return
  end

  vim.fn.mkdir(vim.fn.fnamemodify(test_path, ':h'), 'p')

  -- extract package line from current buffer
  local package_line = ''
  for _, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, 50, false)) do
    if line:match('^package ') then
      package_line = line
      break
    end
  end

  vim.cmd('edit ' .. test_path)
  if vim.fn.filereadable(test_path) == 0 then
    local lines = {}
    if package_line ~= '' then
      table.insert(lines, package_line)
      table.insert(lines, '')
    end
    table.insert(lines, 'class ' .. class_name .. 'Test {')
    table.insert(lines, '')
    table.insert(lines, '}')
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  end
end

vim.api.nvim_create_user_command('JavaTestCreate', create_test_file, {})
