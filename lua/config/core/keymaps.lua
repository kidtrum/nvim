vim.g.mapleader = ","

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk"})

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search hightlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment number
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- increment number

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal size
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current window" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) -- go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) -- go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) -- open current buffer in new tab

-- fast key tab switch
-- keymap.set("n", "<A-.>", "<cmd>tabn<CR>", { desc = "Go to next tab" }) -- go to next tab
-- keymap.set("n", "<A-,>", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) -- go to previous tab

-- fast key buffer switch
keymap.set("n", "<A-h>", "<cmd>bp<CR>", { desc = "Swith to previous buffer" })
keymap.set("n", "<A-t>", "<cmd>bn<CR>", { desc = "Switch to next buffer" })
