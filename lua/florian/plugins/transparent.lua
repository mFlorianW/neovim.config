local transparent_setup, transparent = pcall(require, "transparent")
if not transparent_setup then
    print("Failed to load transparent window")
end

transparent.setup({
    enable = true,
    extra_groups = {
        "FloatBorder",
        "NvimTreeNormal",
        "SagaNormal",
        "SagaBorder",
        "SagaExpand",
        "DefinitionBorder",
        "RenameBorder",
        "RenameNormal",
    }
})
