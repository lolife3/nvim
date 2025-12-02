require("config.remap")
require("config.settings")
require("config.lazy_init")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local CustomConfig = augroup("CustomConfig", {})

-- auto remove trailing whitespaces
autocmd({ "BufWritePre" }, {
    group = CustomConfig,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})


autocmd('FileType', {
    group = CustomConfig,
    callback = function(event)
        local filetype = event.match
        local opts = { buffer = event.buf }


        if filetype == "python" then
            vim.keymap.set("n",
                "<leader>ee", "0iif __name__ == \"__main__\":<cr>main()<esc>",
                opts)

        elseif filetype == "cpp" then
            vim.keymap.set("n",
                "<leader>ee",
                'ostd::cout << "" << "\\n";<Esc>2F"',
                opts)

        elseif filetype == "go" then
            vim.keymap.set("n",
                "<leader>ee",
                "oif err != nil {<CR>}<Esc>Oreturn err<Esc>",
                opts)

        end
    end
})


autocmd('LspAttach', {
    group = CustomConfig,
    callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set({ "n", "v" }, "<leader>f", vim.lsp.buf.format)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count=1, float=true }) end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count=-1, float=true }) end, opts)
    end
})

print("Witaj, Przywoływaczu")
