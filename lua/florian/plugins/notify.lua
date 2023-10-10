local notify_setup, notify = pcall(require, "notify")
if not notify_setup then
    print("Failed to load notify plugin!")
    return
end

notify.setup({
    background_colour = "#000000"
})
