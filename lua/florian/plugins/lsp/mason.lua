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
        "lua_ls",
        "sqlls",
        "cmake",
        "marksman",
        "pyright",
    },
    -- auto-install configured servers (with lspconfig)
    automatic_installation = true,
    automatic_enable = false,
})
