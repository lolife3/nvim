return {
    "nvim-telescope/telescope.nvim",

    tag = "v0.2.0",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')
        telescope.setup({})

        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>ft', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>pww', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>z', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>sw', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
    end
}
