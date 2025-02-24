require("os")

local TMUX_ENV = os.getenv("TMUX")
if TMUX_ENV then
	vim.fn.setenv("TMUX", TMUX_ENV)
end

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

--unmap F1
vim.cmd("inoremap <F1> <Esc>g<C-G>")

--set number in netrw
vim.cmd([[let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro']])

--Ex, save
vim.keymap.set("n", "<leader>bb", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", vim.cmd.w)

-- open/close quickfix list (:cexpr [] to clear list)
vim.keymap.set("n", "<leader>co", vim.cmd.copen)
vim.keymap.set("n", "<leader>cq", vim.cmd.cclose)

-- next/prev quickfix
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- move lines in visual/select mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--append to end of a line
vim.keymap.set("n", "J", "mzJ`z")

-- moving pages leaves cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--use Python json.tool
vim.keymap.set("n", "<leader>jt", "<cmd>execute '%!python3 -m json.tool' | w<CR>")

--next match
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--copy to system clipboard ("vap" - cp paragraph)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

--copy single line
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

--dont override buffer after pasting
vim.keymap.set("x", "<leader>p", [["_dP]])

--replace word in a file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "Q", "<nop>")

--add quotation marks around selected
vim.keymap.set("v", "Q", [[:s/\%V\(.*\)\%V/"\1"/]])

-- create executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- if err not nil
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

-- if __name__ == "__main__"
vim.keymap.set("n", "<leader>nn", "0iif __name__ == \"__main__\":<CR>main()<Esc>")

-- source
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)
