local icons = require("utils.icons").ui

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "debugloop/telescope-undo.nvim",
      "telescope/telescope-fzf-native.nvim",
      "telescope/telescope-ui-select.nvim",
      "telescope/telescope-file-browser.nvim",
      "rcarriga/nvim-notify",
      "kkharji/sqlite.lua",
      { "prochri/telescope-all-recent.nvim", opts = {} },
    },
    lazy = true,
    opts = {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob=!.git/",
        },
        layout_config = {

          horizontal = { prompt_position = "top", results_width = 0.6 },
          vertical = { mirror = false },
        },
        color_devicons = true,
        sorting_strategy = "ascending",
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        prompt_prefix = icons.Telescope, -- or $
        selection_caret = icons.SelectionCaret,
        path_display = { "smart" },
        file_ignore_patterns = {
          "%.7z",
          "%.avi",
          "%.JPEG",
          "%.JPG",
          "%.V",
          "%.RAF",
          "%.burp",
          "%.bz2",
          "%.cache",
          "%.class",
          "%.dll",
          "%.docx",
          "%.dylib",
          "%.epub",
          "%.exe",
          "%.flac",
          "%.ico",
          "%.ipynb",
          "%.jar",
          "%.gif",
          "%.bin",
          "%.jpeg",
          "%.jpg",
          "%.lock",
          "%.mkv",
          "%.mov",
          "%.mp3",
          "%.mp4",
          "%.m4a",
          "%.webm",
          "%.otf",
          "%.pdb",
          "%.pdf",
          "%.png",
          "%.rar",
          "%.sqlite3",
          "%.svg",
          "%.swp",
          "%.swf",
          "%.tar",
          "%.tar.gz",
          "%.ttf",
          "%.webp",
          "%.zip",
          ".git/",
          ".gradle/",
          ".idea/",
          ".vale/",
          ".vscode/",
          "__pycache__/*",
          "build/",
          "env/",
          "gradle/",
          "node_modules/",
          "smalljre_*/*",
          "target/",
          "vendor/*",
        },
      },
    },
    keys = {
      {
        "<leader>sB",
        "<cmd>Telescope find_files cwd=%:p:h<cr>",
        desc = "Browse Files (cwd)",
      },
      {
        "<leader>cu",
        "<cmd>Telescope undo<cr>",
        desc = "Undo History",
      },
      {
        "<leader>sN",
        function()
          require("telescope").extensions.notify.notify()
        end,
        desc = "Search Notifications",
      },
    },

    config = function(_, opts)
      local Util = require("lazyvim.util")
      local telescope = require("telescope")
      if Util.has("nvim-notify") then
        require("telescope").load_extension("notify")
      end
      telescope.setup(opts)
      telescope.load_extension("undo")
      telescope.load_extension("file_browser")
      telescope.load_extension("ui-select")
      telescope.load_extension("harpoon")
    end,
  },
}
