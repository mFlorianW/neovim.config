local cmake_tools_setup, cmake_tools = pcall(require, "cmake-tools")
if not cmake_tools_setup then
    print("Failed to load cmake-tools plugin!")
    return
end

-- Keybindings for cmake
vim.keymap.set("n", "<C-b>", "<cmd>CMakeBuild<CR>")
vim.keymap.set("n", "<C-e>", "<cmd>CMakeRun<CR>")

cmake_tools.setup({
    cmake_command = "cmake",
    cmake_build_directory = "build",
    cmake_build_directory_prefix = "",
    cmake_generate_options = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" },
    cmake_build_options = {},
    cmake_dap_configuration = { -- debug settings for cmake
        name = "cpp",
        type = "codelldb",
        request = "launch",
        stopOnEntry = false,
        runInTerminal = true,
        console = "integratedTerminal",
    },
    cmake_compile_commands_options = {
        action = "soft_link",
    },
    cmake_dap_open_command = require("dap").repl.open, -- optional
    cmake_executor ={
        name = "quickfix",
        opts = {},
        default_opts = {
            quickfix = {
                show = "always",
                position = "horizontal"
            },
            toggleterm = {
                direction = "horizontal", -- 'vertical' | 'horizontal' | 'tab' | 'float'
            }
        }
    },
    cmake_runner = {
        name = "terminal",
        default_opts = {
            toggleterm = {
                direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
                close_on_exit = false, -- whether close the terminal when exit
                auto_scroll = true, -- whether auto scroll to the bottom
            },
        }
    },
    cmake_notifications = {
        runner = { enabled = false }, -- show cmake execution progress in nvim-notify
        executor = { enabled = false }, -- show cmake execution progress in nvim-notify
    },
    -- make_console_position = "bottom", -- "bottom", "top"
    -- don't display the target
    cmake_virtual_text_support = false,
})
