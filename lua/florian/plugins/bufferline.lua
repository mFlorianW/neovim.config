local bufferline_setup, bufferline = pcall(require, "bufferline")
if not bufferline_setup then
    print("Failed to load bufferline plugin!")
    return
end

bufferline.setup()
