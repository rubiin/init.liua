return {
  {
    "utilyre/barbecue.nvim",
    event = "VeryLazy",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = true,
    enabled = function()
      return not require("utils").is_neovim_version_satisfied(10)
    end,
    opts = function()
      local kind_icons = vim.tbl_map(function(icon)
        return vim.trim(icon)
      end, require("lazyvim.config").icons.kinds)
      return {
        theme = "catppuccin",
        show_modified = true,
        kinds = kind_icons,
        create_autocmd = false,
      }
    end,
    config = function(_, opts)
      require("barbecue").setup(opts)
      -- auto update barbecue , more performant than using default autocmd
      vim.api.nvim_create_autocmd({
        "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
        "BufWinEnter",
        "CursorHold",
        "InsertLeave",

        -- include this if you have set `show_modified` to `true`
        "BufModifiedSet",
      }, {
        group = vim.api.nvim_create_augroup("barbecue.updater", { clear = true }),
        callback = function()
          local status_ok, barbeque_ui = pcall(require, "barbecue.ui")
          if not status_ok then
            return
          end
          barbeque_ui.update()
        end,
      })
    end,
  },
}