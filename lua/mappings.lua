require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>de", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

-- Telescope related
map("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
map("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
map("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
map("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
map("n", "<leader>sG", ":LiveGrepGitRoot<cr>", { desc = "[S]earch by [G]rep on Git Root" })
map("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
map("n", "<leader>sr", require("telescope.builtin").resume, { desc = "[S]earch [R]esume" })
map("n", '<leader><leader>', require('telescope.builtin').buffers, {desc = 'Search opened buffers'})

-- Spider (CamelCaseMotions) keymaps
map({ "n", "o", "x" }, "<leader>w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
map({ "n", "o", "x" }, "<leader>e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
map({ "n", "o", "x" }, "<leader>b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
map({ "n", "o", "x" }, "<leader>ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })

-- Git keymap
map("n", "<leader>gg", ":G<Enter>", { desc = "Open fugitive window" })
map("n", "<leader>gm", ":Merginal<Enter>", { desc = "Open merginal window" })

-- Motions
map("n", "<leader>jj", ":HopWord<Enter>", { desc = "Jump to any word" })
map("n", "<leader>jl", ":HopLineStart<Enter>", { desc = "Jump to line start" })
map("n", "<leader>jk", ":HopChar2<Enter>", { desc = "Jump to two matching chars" })
local hop = require "hop"
local directions = require("hop.hint").HintDirection
map("", "f", function()
  hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true }
end, { remap = true })
map("", "F", function()
  hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true }
end, { remap = true })
map("", "t", function()
  hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }
end, { remap = true })
map("", "T", function()
  hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }
end, { remap = true })

-- Nvimtree
map("n", "<leader>tt", ":NvimTreeToggle<Enter>", { desc = "Toggle NvimTree" })

-- Projects
map("n", "<leader>ph", ":NeovimProjectHistory<Enter>", {desc = "Open projects history"})
map("n", "<leader>pd", ":NeovimProjectDiscover<Enter>", {desc = "Discover projects"})

-- Tabufline
map("n", "gb", require("nvchad.tabufline").next, {desc = "Next buffer"})
map("n", "gB", require("nvchad.tabufline").prev, {desc = "Previous buffer"})

-- Disable some mappings
local nomap = vim.keymap.del

nomap("n", "<leader>wk")
nomap("n", "<leader>wK")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
