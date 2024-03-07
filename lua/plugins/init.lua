return {
  { import = "plugins.editor" },
  { import = "plugins.ui" },
  { import = "plugins.lang" },
  { import = "plugins.coding" },
  { import = "plugins.lsp" },
  { import = "plugins.local" },

  -- install from extras if you need them
  -- plugin.<file name without extension> to require it.
  { import = "plugins.extras.wakatime" },
  { import = "plugins.extras.barbecue" },
  { import = "plugins.extras.autosave" },
  { import = "plugins.extras.better-escape" },
  { import = "plugins.extras.cybu" },
  { import = "plugins.extras.zen" },
}
