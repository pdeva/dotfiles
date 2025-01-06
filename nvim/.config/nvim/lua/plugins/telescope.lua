return {{
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {'nvim-lua/plenary.nvim', {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    }},
    config = function()
        require('telescope').setup {
            extensions = {
                fzf = {}
            }
        }
        require('telescope').load_extension('fzf')
        vim.keymap.set("n", "<space>fd", require("telescope.builtin").find_files)
    end

}}
