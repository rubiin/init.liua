-- _   __ _______   ____  ___  ___  ______  _____
-- | | / /|  ___\ \ / /  \/  | / _ \ | ___ \/  ___|
-- | |/ / | |__  \ V /| .  . |/ /_\ \| |_/ /\ `--.
-- |    \ |  __|  \ / | |\/| ||  _  ||  __/  `--. \
-- | |\  \| |___  | | | |  | || | | || |    /\__/ /
-- \_| \_/\____/  \_/ \_|  |_/\_| |_/\_|    \____/

-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Not everything needs to be a keymap, you can also use `user_commands`

local lazyvim_util = require("lazyvim.util")
local keymap, delete_keys = require("utils.helpers").keymap, require("utils.helpers").delete_keymaps

-- Add toggle gitsigns blame line
if lazyvim_util.has("gitsigns.nvim") then
  keymap("n", "<leader>uB", function()
    require("gitsigns").toggle_current_line_blame()
  end, {
    desc = "Toggle Current Line Blame",
  })
end

-- Delete LazyVim default bindings which are nuisance for me
local keymaps_to_delete = {
  { "n", "<leader>l" },
  { "n", "<leader>L" },
  { "n", "<leader>-" },
  { "n", "<leader>|" },
  { "n", "<leader>fT" },
  { "n", "<leader>ft" },
}
delete_keys(keymaps_to_delete)

-- Copy whole file content to clipboard with C-1
keymap("n", "<C-2>", ":%y+<CR>", { desc = "Copy Whole File To Clipboard" })

-- Select all text in buffer with C-2
keymap("n", "<C-2>", "ggVG", { desc = "Select All" })

-- keymap("n", "<C-e>", "yyp", { desc = "Copy and Paste Line" })

-- keymap("n", "<leader>;", function()
--   require("dashboard"):instance()
-- end, { desc = "Open Dashboard" })

-- Add LazyVim bindings for meta information
keymap("n", "<leader>;m", "<cmd>Mason<CR>", { desc = "Package Manager - [Mason]" })
keymap("n", "<leader>;p", "<cmd>Lazy<CR>", { desc = "Plugin Manager - [LazyVim]" })
keymap("n", "<leader>;e", "<cmd>LazyExtras<CR>", { desc = "Extras Manager - [LazyVim]" })
keymap("n", "<leader>;l", "<cmd>LspInfo<CR>", { desc = "Lsp Info" })
keymap("n", "<leader>;i", "<cmd>ConformInfo<CR>", { desc = "Conform Info" })
keymap("n", "<leader>;c", lazyvim_util.news.changelog, { desc = "Changelog [LazyVim]" })
keymap("n", "<leader>;M", vim.cmd.messages, { desc = "Display Messages" })

-- Add spell check to cspell
keymap("n", "<leader>cs", function()
  require("utils.cspell").add_word_to_c_spell_dictionary()
end, { desc = "Add Word To Cspell Dictionary" })

keymap("n", "<leader>==", "<cmd>CellularAutomaton make_it_rain<CR>", {
  desc = "Make It Rain Baby",
})

keymap("n", "<C-/>", function()
  lazyvim_util.terminal(nil, { border = "rounded" })
end, { desc = "Terminal (Root Dir)" })
