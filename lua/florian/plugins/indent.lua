local indent_setup, indent = pcall(require, "ibl")
if not indent_setup then
    print("Failed to load indentation plugin")
    return
end

indent.setup({})
