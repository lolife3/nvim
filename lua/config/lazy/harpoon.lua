return {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set({ "n", "i" }, "<F1>", function() harpoon:list():select(1) end)
        vim.keymap.set({ "n", "i" }, "<F2>", function() harpoon:list():select(2) end)
        vim.keymap.set({ "n", "i" }, "<F3>", function() harpoon:list():select(3) end)
        vim.keymap.set({ "n", "i" }, "<F4>", function() harpoon:list():select(4) end)
        vim.keymap.set({ "n", "i" }, "<F5>", function() harpoon:list():select(5) end)
        vim.keymap.set("n", "<C-F1>", function() harpoon:list():replace_at(1) end)
        vim.keymap.set("n", "<C-F2>", function() harpoon:list():replace_at(2) end)
        vim.keymap.set("n", "<C-F3>", function() harpoon:list():replace_at(3) end)
        vim.keymap.set("n", "<C-F4>", function() harpoon:list():replace_at(4) end)
        vim.keymap.set("n", "<C-F5>", function() harpoon:list():replace_at(5) end)
    end
}
