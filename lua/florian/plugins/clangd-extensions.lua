local clangd_ext_setup, _ = pcall(require, "clangd_extensions")
if not clangd_ext_setup then
    print("Failed to load clangd_extensions plugin")
    return
end
