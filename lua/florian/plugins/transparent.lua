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
        "DefinitionSearch",
        "RenameBorder",
        "RenameNormal",
        "ActionPreviewNormal",
        "ActionPreviewBorder",
        "SagaCollapse",
        "OutlineIndent",
        "FinderLines",
        "FinderPreview",

        -- Bufferline
        "BufferLineBackground",
        "BufferLineTab",
        "BufferLineTabSelected",
        "BufferLineTabClose",
        "BufferLineFill",
        "BufferLineSeparator",
        "BufferLineSeparatorSelected",
        "BufferLineSeparatorVisible",
        "BufferLineIndicatorSelected",
        "BufferLineCloseButton",
        "BufferLineCloseButtonVisible",
        "BufferLineCloseButtonSelected",
        "BufferLineInfo",
        "BufferLineInfoVisible",
        "BufferLineInfoSelected",
        "BufferLineDiagnostic",
        "BufferLineDiagnosticVisible",
        "BufferLineDiagnosticSelected",
        "BufferLineHint",
        "BufferLineHintVisible",
        "BufferLineHintSelected",
        "BufferLinePick",
        "BufferLinePickVisible",
        "BufferLinePickSelected",
        "BufferLineError",
        "BufferLineNumbers",
        "BufferLineNumbersVisible",
        "BufferLineNumbersSelected",
        "BufferLineTab",
        "BufferLineTabSelected",
        "BufferLineBuffer",
        "BufferLineBufferSelected",
        "BufferLineBufferVisible",
        "BufferLineOffsetSeparator",
        "BufferLineDuplicate",
        "BufferLineDuplicateVisible",
        "BufferLineDuplicateSelected",
    },
})
