local clangd_ext_setup, clangd_ext = pcall(require, "clangd_extensions")
if not clangd_ext_setup then
    print("Failed to load clangd_extensions plugin")
    return
end

clangd_ext.setup({
    server = {
        require("florian.plugins.lsp.lspconfig").lspconfig.clangd.setup()
    }
})
