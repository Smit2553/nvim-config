return {
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup()
    end,
    
    "williamboman/mason-lspconfig.nvim",
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = { "clangd" }
        })
    end,
    
    "neovim/nvim-lspconfig",
    config = function()
        require("lspconfig").clangd.setup({
            keys = {
                { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
            },
            root_dir = function(fname)
                return require("lspconfig.util").root_pattern(
                    "Makefile",
                    "configure.ac",
                    "configure.in",
                    "config.h.in",
                    "meson.build",
                    "meson_options.txt",
                    "build.ninja"
                )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(fname)
            end
        })
    end
}

