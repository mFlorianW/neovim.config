local util_setup, util = pcall(require, "formatter.util")
if not util_setup then
    return
end

local formatter_setup, formatter = pcall(require, "formatter")
if not formatter_setup then
    return
end

formatter.setup({
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        cpp = { require('formatter.filetypes.cpp').clangformat },
        c = { require('formatter.filetypes.c').clangformat },
        python = { require('formatter.filetypes.python').black },
        rust = {
	        function()
	            return {
	                exe = "rustfmt",
	                stdin = true,
	            }
	        end,
        }
    },
})

vim.api.nvim_create_autocmd({"BufWritePost"}, {
    command = "FormatWrite"
})
