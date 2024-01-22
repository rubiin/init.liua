-- _   __ _______   ____  ___  ___  ______  _____
-- | | / /|  ___\ \ / /  \/  | / _ \ | ___ \/  ___|
-- | |/ / | |__  \ V /| .  . |/ /_\ \| |_/ /\ `--.
-- |    \ |  __|  \ / | |\/| ||  _  ||  __/  `--. \
-- | |\  \| |___  | | | |  | || | | || |    /\__/ /
-- \_| \_/\____/  \_/ \_|  |_/\_| |_/\_|    \____/

-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local lazyvim_util = require('lazyvim.util')
local del = vim.keymap.del
local keymap, toggle_light_dark_theme =
    require('utils.helpers').keymap, require('utils.helpers').toggle_light_dark_theme


-- Add toggle gitsigns blame line
if lazyvim_util.has('gitsigns.nvim') then
  keymap('n', '<leader>ub', function()
    require("gitsigns").toggle_current_line_blame()
  end, {
    desc = 'Toggle current line blame',
  })
end

-- keymap for toggling light and dark mode
keymap('n', '<leader>uD', toggle_light_dark_theme, {
  desc = 'Toggle dark/light mode',
})

-- Delete LazyVim default bindings
del('n', '<leader>l')
del('n', '<leader>L')
del('n', '<leader>-')


-- Add LazyVim bindings for meta information
keymap('n', '<leader>;m', '<cmd>Mason<CR>', { desc = 'Package Manager - [Mason]' })
keymap('n', '<leader>;p', '<cmd>Lazy<CR>', { desc = 'Plugin Manager - [LazyVim]' })
keymap('n', '<leader>;e', '<cmd>LazyExtras<CR>', { desc = 'Extras Manager - [LazyVim]' })
keymap('n', '<leader>;n', '<cmd>LspInfo<CR>', { desc = 'Lsp Info' })
keymap('n', '<leader>;i', '<cmd>ConformInfo<CR>', { desc = 'Conform Info' })
keymap('n', '<leader>;c', lazyvim_util.news.changelog, { desc = 'Changelog [LazyVim]' })
keymap('n', '<leader>;r', lazyvim_util.root.info, { desc = 'Root Info [LazyVim]' })
keymap('n', '<leader>;M', vim.cmd.messages, { desc = 'Display messages' })
