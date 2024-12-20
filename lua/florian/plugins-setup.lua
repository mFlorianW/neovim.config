-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    return
end

return packer.startup(function(use)
    use("wbthomason/packer.nvim")
    -- use("bluz71/vim-nightfly-guicolors")
    use('shaunsingh/nord.nvim')
    -- use('arcticicestudio/nord-vim')
    use("christoomey/vim-tmux-navigator")
    use("szw/vim-maximizer")
    use("tpope/vim-surround")
    use("vim-scripts/ReplaceWithRegister")
    use("numToStr/Comment.nvim")
    use("nvim-lua/plenary.nvim")
    use("nvim-tree/nvim-tree.lua")
    use("kyazdani42/nvim-web-devicons")
    use("nvim-lualine/lualine.nvim")
    use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"})
    use({"nvim-telescope/telescope.nvim", branch = "0.1.x" })
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")

    -- managing and installing lsp server
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")

    -- configuring lsp server
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    -- use({ "glepnir/lspsaga.nvim", commit = "7722e9728abe47eebe32d13e6c46e3c4e51f9629"})
    use({ "glepnir/lspsaga.nvim"})
    use("onsails/lspkind.nvim")

    -- clangd plugins
    use("p00f/clangd_extensions.nvim")

    -- treesitter
    use({"nvim-treesitter/nvim-treesitter", run=function() require("nvim-treesitter.install").update({ with_sync = true}) end})

    -- auto closing
    use("windwp/nvim-autopairs")
    use({"windwp/nvim-ts-autotag", after = "nvim-treesitter"} )

    -- git integration
    use("lewis6991/gitsigns.nvim")

    -- transparent background
    use("xiyaowong/nvim-transparent")

    -- formatting 
    use({"mhartington/formatter.nvim", commit = "8a4c961330cc4688087f23d18fa7d2f1af9a4902"})

    -- debugger
    use("mfussenegger/nvim-dap")
    use{"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}

    -- cmake integration
    use("Civitasv/cmake-tools.nvim")

    -- topbar 
    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

    -- rust integration
    use ('mrcjkb/rustaceanvim')

    -- linter
    use('mfussenegger/nvim-lint')

    -- toggle terminal plugin
    use {"akinsho/toggleterm.nvim", tag = '*'}

    -- cpp tools
    use {
        requires = { "nvim-treesitter/nvim-treesitter" },
        "Badhi/nvim-treesitter-cpp-tools",
    }

    -- minimap
    use { "wfxr/minimap.vim" }

    -- indent plugin
    use { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }

    -- nvim notify
    use { "rcarriga/nvim-notify" }

    if packer_bootstrap then
        require("packer").sync()
    end
end)
