local cmake_tools_setup, cmake_tools = pcall(require, "cmake-tools")
if not cmake_tools_setup then
    print("Failed to load cmake-tools plugin!")
    return
end

-- Keybindings for cmake
vim.keymap.set("n", "<C-b>", "<cmd>CMakeBuild<CR>")

cmake_tools.setup({
    cmake_command = "cmake",
    cmake_build_directory = "build",
    cmake_build_directory_prefix = "",
    cmake_generate_options = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" },
    cmake_build_options = {},
    cmake_dap_configuration = { name = "cpp", type = "lldb", request = "launch" }, -- dap configuration, optional
    cmake_soft_link_compile_commands = true,
    cmake_dap_open_command = require("dap").repl.open, -- optional
    cmake_variants_message = {
        short = { show = true },
        long = { show = true, max_length = 40 }
    },
    cmake_executor = {
        name = "quickfix",
        default_opts = {
            quickfix = {
                show = "only_on_error", -- "always", "only_on_error"
                position = "belowright", -- "bottom", "top"
                size = 15,
            },
        }
    },
    cmake_notifications = {
        enabled = true, -- show cmake execution progress in nvim-notify
        spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, -- icons used for progress display
        refresh_rate_ms = 100, -- how often to iterate icons
    },
    -- make_console_position = "bottom", -- "bottom", "top"
})
