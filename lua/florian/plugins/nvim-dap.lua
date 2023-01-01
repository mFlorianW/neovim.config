local dap_setup, dap = pcall(require, "dap")
if not dap_setup then
    print("Failed to load plugin DAP")
    return
end

dap.adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb-vscode",
    name = "lldb"
}

dap.configurations.cpp = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
    },
}

dap.configurations.c = dap.configurations.cpp

-- local keymap = vim.keymap
-- keymap.set("n", "<F5>", "lua require'dap'.continue()<CR>", {silent = true})
-- keymap.set("n", "<F10>", "lua require'dap'.step_over()<CR>", {silent = true})
-- keymap.set("n", "<F11>", "lua require'dap'.step_into()<CR>", {silent = true})
-- keymap.set("n", "<F12>", "lua require'dap'.step_out()<CR>", {silent = true})
-- keymap.set("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", {silent = true})
-- keymap.set("n", "<leader>B", "<cmd>lua require'dap'.toggle_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {silent = true})
-- keymap.set("n", "<leader>lp", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", {silent = true})
--    nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
--    nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
