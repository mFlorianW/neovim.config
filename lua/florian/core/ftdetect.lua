vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.qml",
    command = "set filetype=qml"
})
