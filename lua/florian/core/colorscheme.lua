local status, _ = pcall(vim.cmd, "colorscheme nord")
if not status then
    print("Colorscheme nord not found!")
    return
end

