local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return
end

local utils_setup, utils = pcall(require, "florian.plugins.utils")
if not utils_setup then
    print("Failed to load utils functions")
    return
end

local keymap = vim.keymap

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
        vim.lsp.inlay_hint.enable(true)
    end
end


-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

vim.g.rustaceanvim = {
  -- LSP configuration
  server = {
        on_attach = on_attach,
        capabilities = capabilities,
    }
}

lspconfig["clangd"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "clangd", "-j=12", "--header-insertion=never", "--use-dirty-headers", "--clang-tidy=1", "--background-index"},
    on_new_config = function(new_config, new_cwd)
        local status, cmake = pcall(require, "cmake-tools")
        if status then
            cmake.clangd_on_new_config(new_config)
        end
    end,
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

lspconfig["qmlls"].setup({
    cmd = { utils.qmlls_binary(), string.format("%s", utils.qml_dirs(utils.cmake_build_dir()))},
    capabilities = capabilities,
    on_attach = on_attach
})


lspconfig["pyright"].setup({
    capabilities = capabilities,
    on_attach = on_attach
})
