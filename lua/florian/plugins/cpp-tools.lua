local setup, cpptools = pcall(require, "nt-cpp-tools")
if not setup then
    print("Failed to load cpp-tools-plugin")
    return
end

cpptools.setup({
    preview = {
        quit = 'q', -- optional keymapping for quit preview
        accept = '<tab>' -- optional keymapping for accept preview
    }
})
