local toggleterm_setup, toggleterm = pcall(require, "toggleterm")
if not toggleterm_setup then
    print("Failed to load toggleterm plugin!")
    return
end

toggleterm.setup({
    open_mapping = "<leader>t",
    shade_terminals = false,
    direction = "float",
    terminal_mappings = false,
    insert_mappings = false,
})

