return {

  -- profiling vim startup
  {
    enabled = false,
    lazy = true,
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },
  -- wakatime
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
    lazy = true,
  },

  {
    "echasnovski/mini.misc",
    config = true,
    lazy = true,
    event = "VeryLazy",
    --stylua: ignore
    keys = {
      {
        '<leader>uz',
        function()
          require('mini.misc').zoom()
        end,
        desc = 'Toggle Zoom'
      }
    }
,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 2000,
      -- Animation style
      stages = "fade_in_slide_out",
    },
  },

  {
    "eandrju/cellular-automaton.nvim",
    event = "VeryLazy",
    lazy = true,
    cmd = "CellularAutomaton",
  },
}
