local toggleterm_setup, toggleterm = pcall(require, "toggleterm")
if not toggleterm_setup then
    print("Failed to load toggleterm plugin!")
    return
end

toggleterm.setup({
    shade_terminals = false,
    direction = "float",
    terminal_mappings = true,
    insert_mappings = false,
    shell = "bash"
})

