local TestToggle = {}

TestToggle.config = {
  src_path_pattern = "src/main/scala/(.+)%.scala$",
  src_replace_pattern = "src/test/scala/%1Spec.scala",
  test_path_pattern = "src/test/scala/(.+)Spec%.scala$",
  test_replace_pattern = "src/main/scala/%1.scala",
}

function TestToggle.setup(user_config)
  TestToggle.config = vim.tbl_extend('force', TestToggle.config, user_config or {})
end

function TestToggle.toggle_between_source_and_test()
  local current_file = vim.fn.expand('%:p')

  if string.match(current_file, TestToggle.config.test_path_pattern) then
    local source_file = string.gsub(current_file, TestToggle.config.test_path_pattern, TestToggle.config.test_replace_pattern)
    if vim.fn.filereadable(source_file) == 1 then
      vim.cmd('edit! ' .. source_file)
    else
      vim.cmd('echohl ErrorMsg | echo "Corresponding source file not found" | echohl None')
    end
  else
    local test_file = string.gsub(current_file, TestToggle.config.src_path_pattern, TestToggle.config.src_replace_pattern)
    if vim.fn.filereadable(test_file) == 1 then
      vim.cmd('edit! ' .. test_file)
    else
      vim.cmd('echohl ErrorMsg | echo "Corresponding test file not found" | echohl None')
    end
  end
end

return TestToggle
