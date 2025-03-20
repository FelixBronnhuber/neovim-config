require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Custom mappings for moving 5 lines at a time
-- map("n", "J", "5j", { desc = "Move down 5 lines" })
-- map("n", "K", "5k", { desc = "Move up 5 lines" })

-- Custom mappings for telescope
map("n", "<leader><space>", require("telescope.builtin").find_files, {
  desc = "Telescope: Find Files",
})

map("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

map("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
