local treesitter_setup, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_setup then
    return
end

treesitter.setup({
    highlight = {
        enable = true,
    },
    indent = {
        enable = false,
    },
    autotag = {
        enable = true,
    },
    ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "markdown",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "cpp",
        "c",
        "gitcommit",
        "gitignore",
        "latex",
        "proto",
        "rust",
        "sql",
        "qmljs"
    },
    auto_install = true
})
