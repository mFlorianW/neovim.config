local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
    return
end

-- Recomended settings of the plugin
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])
nvimtree.setup({
    -- change folder arrow icons
    renderer = {
        icons = {
            glyphs = {
                folder = {
                    arrow_closed = "", -- arrow when folder is closed
                    arrow_open = "", -- arrow when folder is open
                },
            },
        },
    },
    -- explorer to work well with
    -- window splits
    actions = {
        open_file = {
            window_picker = {
                enable = true,
            },
        },
    },
    view = {
        adaptive_size = true,
        side = "right",
        float = {
            enable = true,
            open_win_config = {
                relative = "editor",
                border = "rounded",
                width = 30,
                height = 30,
                row = 5,
                col = 50,
            }
        }
    },
    filters = {
        dotfiles = false,
    },
    git = {
        ignore = false,
    },
})
