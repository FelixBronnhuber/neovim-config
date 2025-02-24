require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Custom mappings for moving 5 lines at a time
-- map("n", "J", "5j", { desc = "Move down 5 lines" })
-- map("n", "K", "5k", { desc = "Move up 5 lines" })

-- Custom mappings for teleskope
map("n", "<leader><space>", require("telescope.builtin").find_files, {
  desc = "Telescope: Find Files",
})
