return {{
    "neovim/nvim-lspconfig",
    dependencies = {{
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = { -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            {
                path = "${3rd}/luv/library",
                words = {"vim%.uv"}
            }}
        }
    }},
    config = function()
        require("lspconfig").lua_ls.setup({})
        require("lspconfig").rust_analyzer.setup({
            settings = {
                ['rust-analyzer'] = {
                    check = {
                        command = "clippy"
                    },
                    diagnostics = {
                        enable = true
                    }
                }
            }
        })
    end
} --  {
--     'mrcjkb/rustaceanvim',
--     version = '^5', -- Recommended
--     lazy = false, -- This plugin is already lazy
--     ft = 'rust',
--     dependencies = {{
--         'Joakker/lua-json5',
--         build = './install.sh',
--         config = function()
--             -- Support JSON5 syntax in .vscode/settings.json
--             ---@diagnostic disable-next-line: duplicate-set-field
--             vim.json.decode = function(str, _)
--                 return require('json5').parse(str)
--             end
--         end
--     }}
-- }
}
