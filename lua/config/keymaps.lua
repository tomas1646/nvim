local set = vim.keymap.set

-- Out of insert mode
set("i", "jj", "<Esc>")

-- Up/Down center
set("n", "<C-d>", "<C-d>zz", { noremap = true })
set("n", "<C-u>", "<C-u>zz", { noremap = true })

-- Center on search
set("n", "n", "nzzzv", { noremap = true })
set("n", "N", "Nzzzv", { noremap = true })

-- Move highlighted text up/Down
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

-- Copy system clipboard
-- set("n", "<leader>y", '"+y')
-- set("v", "<leader>y", '"+y')

-- Copy to system clipboard
set("n", "y", '"+y')
set("v", "y", '"+y')

-- Paste inside highlighted text and don't lose the content in the register
set({ "n", "v" }, "<leader>p", '"_dP')

-- Find and replace current word
set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Regex t to translate -> javascript
-- :%s/'\(\w\+\)\.\(\%(\w\+\.\?\)\+\)\.\(\w\+\)'/\{ file: '\1', model: '\2', key: '\3' \}
set("n", "<leader>ft", [[:%s/'\(\w\+\)\.\(\%(\w\+\.\?\)\+\)\.\(\w\+\)'/\{ file: '\1', model: '\2', key: '\3' \}]])

-- Quickfix list
set("n", "<C-k>", "<cmd>cprev<CR>zz")
set("n", "<C-j>", "<cmd>cnext<CR>zz")

-- Tmux sessionizer
set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- *****************
-- LSP
-- *****************
set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap = true, silent = true })
set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
set("n", "<leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })

-- *****************
-- Telescope
-- *****************
set("n", "<leader>ff", ":Telescope find_files<CR>") -- Files Find
set("n", "<leader>fg", ":Telescope live_grep<CR>") -- Files Grep

-- *****************
-- NvimTree
-- *****************
set("n", "<leader>tt", ":NvimTreeToggle<CR>")

-- *****************
-- Barbar (buffers)
-- *****************
local opts = { noremap = true, silent = true }
-- Move to previous/next
set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
set("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
-- Goto buffer in position...
set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
-- Close
set("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
set("n", "<A-a>", "<Cmd>BufferCloseAllButCurrent<CR>", opts)

-- *****************
-- Formatting
-- *****************
set({ "n", "v" }, "<leader>fc", "<Cmd>:Format<CR>", { noremap = true }) -- Format Current File
set("n", "<leader>fa", "<Cmd>:bufdo FormatSync<CR>:wa<CR>") -- Format and save all buffers
