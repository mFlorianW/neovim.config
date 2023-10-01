local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return
end

local clangd_ext_setup, clangd_ext = pcall(require, "clangd_extensions")
if not clangd_ext_setup then
    print("Failed to load clangd_extensions plugin")
    return
end

local rust_tools_setup, rust_tools = pcall(require, "rust-tools")
if not rust_tools_setup then
    print("Failed to load rust-tools")
end

local keymap = vim.keymap

rust_tools.setup({
    server = {
        on_attach = function (_, bufnr)
            vim.keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", {buffer = bufnr}) -- show definition, references
            vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", {buffer = bufnr}) -- got to declaration
            vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", {buffer = bufnr}) -- see definition and make edits in window
            vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {buffer = bufnr}) -- go to implementation
            -- Hover actions
            vim.keymap.set("n", "<leader>a", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>ca", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
            vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { buffer = bufnr }) -- smart rename
            vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", { buffer = bufnr }) -- show  diagnostics for line
            vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { buffer = bufnr }) -- show diagnostics for cursor
            vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { buffer = bufnr }) -- jump to previous diagnostic in buffer
            vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { buffer = bufnr }) -- jump to next diagnostic in buffer
            vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { buffer = bufnr }) -- show documentation for what is under cursor
            vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { buffer = bufnr }) -- see outline on right hand side
            end,
    },
    tools = {
        inlay_hints = {
            auto = true,
            show_parameter_hints = true,
        }
    },
})

-- enable keybinds  for available lsp server
local on_attach = function(client, bufnr)
    -- keybind options
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- set keybinds
    keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts) -- show definition, references
    keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
    keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
    keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
    keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
    keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
    keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
    keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
    keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
    keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
    keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
    keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts) -- see outline on right hand side

    if client.name == "clangd" then
        keymap.set("n", "<F4>", "<cmd>ClangdSwitchSourceHeader<CR>", opts) -- bind F4 to switch between header and source
        require("clangd_extensions.inlay_hints").set_inlay_hints()
    end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["clangd"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig["cmake"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig["marksman"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

-- lspconfig["rust_analyzer"].setup({
--     capabilities = capabilities,
--     on_attach = on_attach
-- })


lspconfig["pyright"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})
