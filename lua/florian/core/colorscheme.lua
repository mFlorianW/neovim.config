local status, _ = pcall(vim.cmd, "colorscheme nord")
if not status then
    print("Colorscheme nord not found!")
    return
end

local api = vim.api
api.nvim_set_hl(0, "LspInlayHint", { fg = "#4C566A", bg = "NONE", italic = true })

