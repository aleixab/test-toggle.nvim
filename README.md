# Test Toggle for Neovim

This plugin allows you to toggle between source and test files in Neovim, making it easy to switch back and forth while developing and testing your code.

## Installation

### Example with packer.nvim:

```lua
use 'aleixab/test-toggle.nvim'
```

## Configuration

You can configure the plugin to match your project's directory structure and file naming conventions. Here's an example configuration for a Scala project:

```lua
require('test-toggle').setup({
  src_path_pattern = "src/main/scala/(.+)%.scala$",
  src_replace_pattern = "src/test/scala/%1Spec.scala",
  test_path_pattern = "src/test/scala/(.+)Spec%.scala$",
  test_replace_pattern = "src/main/scala/%1.scala",
})
```

This configuration example assumes that your source files are located in the src/main/scala directory and test files in the src/test/scala directory, and that test files are named with a Spec suffix.

You can adjust these patterns according to your project's specific directory structure and naming conventions.

## Usage

You can map a key to toggle between source and test files. Here's an example of how to set up a keymap:

```lua
vim.api.nvim_set_keymap('n', '<leader>tt', [[<cmd>lua require('test_toggle').toggle_between_source_and_test()<CR>]], { noremap = true, silent = true })
```

With this keymap, pressing <leader>tt will toggle between the source and corresponding test file, based on the configuration provided. If a corresponding file is not found, an error message will be displayed in the command line.

