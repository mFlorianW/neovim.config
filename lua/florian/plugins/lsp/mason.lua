local mason_status, mason = pcall(require, "mason")
if not mason_status then
    return
end

local mason_lsp_config_status, mason_lsp_config = pcall(require, "mason-lspconfig")
if not mason_lsp_config_status then
    return
end

mason.setup()

mason_lsp_config.setup({
    ensure_installed = {
        "clangd",
        "neocmake",
        "sumneko_lua",
        "sqlls",
    },
    -- auto-install configured servers (with lspconfig)
    automatic_installation = true, 
})
