local transparent_setup, transparent = pcall(require, "transparent")
if not transparent_setup then
    print("Failed to load transparent window")
end

transparent.setup({
    extra_groups = {
        -- NvimTree
        "NvimTreeNormal",

        -- LspSaga
        "FloatBorder",
        "SagaNormal",
        "SagaBorder",
        "SagaExpand",
        "DefinitionBorder",
        "RenameBorder",
        "RenameNormal",

        -- Bufferline
        "BufferLineBackground",
        "BufferLineTabClose",
        "BufferLineFill",
        "BufferLineSeparator",
        "BufferLineIndicatorSelected",
        "BufferLineCloseButton",
        "BufferLineInfo",
        "BufferLineDiagnostic",
        "BufferLineHint",
        "BufferLinePick",
        "BufferLineError",
        "BufferLineNumbers",
        "BufferLineTab",
    },
})
