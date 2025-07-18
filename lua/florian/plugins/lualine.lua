local status, lualine = pcall(require, "lualine")
if not status then
    return
end

local custom_nord = require'lualine.themes.nord'
custom_nord.normal.c.bg = "None"
custom_nord.normal.b.bg = "#3b4252"

lualine.setup({
    options = {
        theme = 'nord',
    },
})

