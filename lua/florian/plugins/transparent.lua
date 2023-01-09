local transparent_setup, transparent = pcall(require, "transparent")
if not transparent_setup then
    print("lkjsfgdklsfdkfdsmlksfdm")
end

transparent.setup({
    enable = true,
    extra_groups = {
        "NvimTreeNormal"
    }
})
