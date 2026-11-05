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
set("n", "<A-k>", "<cmd>cprev<CR>zz")
set("n", "<A-j>", "<cmd>cnext<CR>zz")

-- Herdr sessionizer (runs fzf in a floating terminal, closes when done)
set("n", "<C-f>", function()
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    col = math.floor((vim.o.columns - width) / 2),
    row = math.floor((vim.o.lines - height) / 2),
    style = "minimal",
    border = "rounded",
  })
  vim.fn.jobstart({ "herdr-sessionizer" }, {
    term = true,
    on_exit = function()
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
    end,
  })
  vim.cmd("startinsert")
end)

-- *****************
-- Herdr navigation (replaces vim-tmux-navigator)
-- Ctrl+h/j/k/l moves between nvim splits; at the edge, focuses the herdr pane
-- in that direction. Herdr forwards these keys to nvim via ~/.config/herdr/navigate.sh
-- *****************
local function navigate(wincmd, direction)
  return function()
    local win = vim.api.nvim_get_current_win()
    vim.cmd("wincmd " .. wincmd)
    if vim.api.nvim_get_current_win() == win and vim.env.HERDR_PANE_ID then
      vim.system({
        vim.env.HERDR_BIN_PATH or "herdr", "pane", "focus",
        "--pane", vim.env.HERDR_PANE_ID, "--direction", direction,
      })
    end
  end
end
set("n", "<C-h>", navigate("h", "left"), { desc = "Navigate left (nvim/herdr)" })
set("n", "<C-j>", navigate("j", "down"), { desc = "Navigate down (nvim/herdr)" })
set("n", "<C-k>", navigate("k", "up"), { desc = "Navigate up (nvim/herdr)" })
set("n", "<C-l>", navigate("l", "right"), { desc = "Navigate right (nvim/herdr)" })

-- *****************
-- LSP
-- *****************
set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap = true, silent = true })
set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
set("n", "[", "<cmd>lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>", { noremap = true, silent = true })
set("n", "]", "<cmd>lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>", { noremap = true, silent = true })
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

-- Close
set("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
set("n", "<A-a>", "<Cmd>BufferCloseAllButCurrent<CR>", opts)

-- Move Tabs Left/Right
set("n", "<", "<Cmd>BufferMovePrevious<CR>", opts)
set("n", ">", "<Cmd>BufferMoveNext<CR>", opts)

-- *****************
-- Formatting
-- *****************
set({ "n", "v" }, "<leader>fc", "<Cmd>:Format<CR>", { noremap = true }) -- Format Current File
set("n", "<leader>fa", "<Cmd>:bufdo FormatSync<CR>:wa<CR>") -- Format and save all buffers

-- *****************
-- DiffView
-- *****************
set("n", "<leader>do", ":DiffviewOpen<CR>")
set("n", "<leader>dc", ":DiffviewClose<CR>")

