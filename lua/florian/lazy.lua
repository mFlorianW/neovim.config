local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
        { out, "WarningMsg" },
        { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    -- highlight-start
    -- spec = {
    --   -- import your plugins
    --   { import = "plugins" },
    -- },
    -- highlight-end
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },   
    -- Installed plugins
    "shaunsingh/nord.nvim",
    "christoomey/vim-tmux-navigator",
    "szw/vim-maximizer",
    "tpope/vim-surround",
    "vim-scripts/ReplaceWithRegister",
    "numToStr/Comment.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-tree.lua",
    "kyazdani42/nvim-web-devicons",
    "nvim-lualine/lualine.nvim",
    {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
    {"nvim-telescope/telescope.nvim", branch = "0.1.x" },
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- configuring lsp server
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    { "glepnir/lspsaga.nvim"},
    "onsails/lspkind.nvim",

    -- clangd plugins
    "p00f/clangd_extensions.nvim",

    -- treesitter
    {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},

    -- auto closing
    "windwp/nvim-autopairs",
    {"windwp/nvim-ts-autotag", after = "nvim-treesitter"},

    -- git integration
    "lewis6991/gitsigns.nvim",

    -- transparent background
    "xiyaowong/nvim-transparent",

    -- formatting 
    {"mhartington/formatter.nvim", commit = "8a4c961330cc4688087f23d18fa7d2f1af9a4902"},

    -- debugger
    "mfussenegger/nvim-dap",
    {"rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}},

    -- cmake integration
    "Civitasv/cmake-tools.nvim",

    -- rust integration
    'mrcjkb/rustaceanvim',

    -- linter
    'mfussenegger/nvim-lint',

    -- toggle terminal plugin
    {"akinsho/toggleterm.nvim", tag = '*'},

    "Badhi/nvim-treesitter-cpp-tools",

    -- minimap
    -- { "wfxr/minimap.vim" },

    -- indent plugin
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    -- nvim notify
    { "rcarriga/nvim-notify" },

    -- copilot
    { "github/copilot.vim" },

    -- copilot chat
    { "CopilotC-Nvim/CopilotChat.nvim", dependencies = "nvim-lua/plenary.nvim", branch = "main", },
})
