return {{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {"c", "lua", "vim", "vimdoc", "query", "markdown", "rust", "make", "toml", "json",
                                "yaml", "html", "go", "java", "starlark", "python", "gomod", "gosum"},
            auto_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            }
        }
    end
}}

