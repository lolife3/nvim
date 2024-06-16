vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.cmd("inoremap <F1> <Esc>g<C-G>")

vim.keymap.set("n", "<leader>bb", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", vim.cmd.w)

-- open/close quickfix list (:cexpr [] to clear list)
vim.keymap.set("n", "<leader>co", vim.cmd.copen)
vim.keymap.set("n", "<leader>cq", vim.cmd.cclose)

-- next/prex quickfix
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- move lines in visual
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")	--append to end of a line

-- move through file
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--next match
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])	--dont override buffer after pasting

-- save to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])	--"ap" to copy paragraph
vim.keymap.set("n" , "<leader>Y", [["+Y]])	--single line
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])


vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)


vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])	--replace word in a file
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("v", "Q", [[:s/\%V\(.*\)\%V/"\1"/]])	--add quotation marks around selected

-- create executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- if err not nil
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)



--opts--
vim.opt.nu = true
vim.opt.smartindent = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.optexpandtab = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = "undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"



