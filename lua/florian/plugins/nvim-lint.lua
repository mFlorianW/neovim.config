local lint_setup, lint = pcall(require, "lint")
if not lint_setup then
    print("Failed to load plugin nvim-lint")
    return
end

local utils_setup, utils = pcall(require, "florian.plugins.utils")
if not utils_setup then
    print("Failed to load utils functions")
    return
end

local pattern = [=[([^:]*):(%d+):(%d+): (%w+): ([^[]+) %[%-Wclazy%-(.*)%]]=]
local groups = { 'file', 'lnum', 'col', 'severity', 'message', 'code'}

lint.linters.clazy2 = {
  cmd = 'clazy-standalone',
  stdin = false,
  args = { string.format("-p %s", utils.cmake_build_dir()), },
  stream = 'stderr',
  parser = require('lint.parser').from_pattern(pattern, groups, nil, { ['source'] = 'clazy' }),
}

lint.linters_by_ft = {
    cpp = {"clazy2"},
}

vim.api.nvim_create_autocmd({ "BufWritePost", "TextChanged" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
