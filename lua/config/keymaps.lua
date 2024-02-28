-- ========================================================================== --
-- ==                          Key Maps                                    == --
-- ========================================================================== --
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Not everything needs to be a keymap, you can also use `user_commands`

local lazyvim_util = require("lazyvim.util")
local utils = require("utils")

utils.cowboy()

utils.keymap("n", "<C-1>", ":%y+<CR>", { desc = "Copy Whole File To Clipboard" })

-- Select all text in buffer with C-2
utils.keymap("n", "<C-2>", "ggVG", { desc = "Select All" })

-- Add LazyVim bindings for meta information
utils.keymap("n", "<leader>;m", "<cmd>Mason<CR>", { desc = "Package Manager - [Mason]" })
utils.keymap("n", "<leader>;p", "<cmd>Lazy<CR>", { desc = "Plugin Manager - [LazyVim]" })
utils.keymap("n", "<leader>;e", "<cmd>LazyExtras<CR>", { desc = "Extras Manager - [LazyVim]" })
utils.keymap("n", "<leader>;l", "<cmd>LspInfo<CR>", { desc = "Lsp Info" })
utils.keymap("n", "<leader>;i", "<cmd>ConformInfo<CR>", { desc = "Conform Info" })
utils.keymap("n", "<leader>;c", lazyvim_util.news.changelog, { desc = "Changelog [LazyVim]" })
utils.keymap("n", "<leader>;M", vim.cmd.messages, { desc = "Display Messages" })

-- Override LazyVim bindings for terminal
utils.keymap("n", "<C-/>", function()
  lazyvim_util.terminal(nil, { border = vim.g.border_style })
end, { desc = "Terminal (Root Dir)" })

-- Add keymap to open URL under cursor
utils.keymap("n", "gx", function()
  utils.open_url()
end, { desc = "Open URL Under Cursor" })

utils.keymap("n", "z=", function()
  require("telescope.builtin").spell_suggest(require("telescope.themes").get_cursor({}))
end, { desc = "Open Telescope Spell Suggest" })

vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
