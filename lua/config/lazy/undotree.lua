return {
    "mbbill/undotree",

    config = function()
	vim.g.undotree_DiffCommand = "FC"       --REMOVE FOR LINUX!!
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end
}
