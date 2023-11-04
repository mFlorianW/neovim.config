local dap_setup, dap = pcall(require, "dap")
if not dap_setup then
    print("Failed to load plugin DAP")
    return
end

local dap_ui_setup, dapui = pcall(require, "dapui")
if not dap_ui_setup then
    print("Failed to load plugin DAPUI")
    return
end

dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = vim.fn.expand("~") .. "/.local/share/nvim/mason/packages/codelldb/codelldb",
        args = { "--port", "${port}" },
    },
    name = "codelldb"
}

dapui.setup({

})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

-- local keymap = vim.keymap
vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", {silent = true})
vim.keymap.set("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>", {silent = true})
vim.keymap.set("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>", {silent = true})
vim.keymap.set("n", "<F12>", "<cmd>lua require'dap'.step_out()<CR>", {silent = true})
vim.keymap.set("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", {silent = true})
vim.keymap.set("n", "<leader>B", "<cmd>lua require'dap'.toggle_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {silent = true})
vim.keymap.set("n", "<leader>lp", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", {silent = true})
--    nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
--    nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
