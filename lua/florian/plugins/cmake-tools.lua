local cmake_tools_setup, cmake_tools = pcall(require, "cmake-tools")
if not cmake_tools_setup then
    print("Failed to load cmake-tools plugin!")
    return
end

cmake_tools.setup({
    cmake_command = "cmake",
    cmake_build_directory = "build",
    cmake_build_directory_prefix = "",
    cmake_generate_options = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" },
    cmake_build_options = {},
    cmake_console_size = 30, -- cmake output window height
    cmake_show_console = "always", -- "always", "only_on_error"
    cmake_dap_configuration = { name = "cpp", type = "lldb", request = "launch" }, -- dap configuration, optional
    cmake_dap_open_command = require("dap").repl.open, -- optional
    cmake_variants_message = {
        short = { show = true },
        long = { show = true, max_length = 40 }
    }
})
