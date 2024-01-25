return {

  -- profiling vim startup
  {
    enabled = false,
    lazy = true,
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
    -- init is called during startup. Configuration for vim plugins typically should be set in an init function
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },
  -- waka time
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
    },
  },

  {
    "eandrju/cellular-automaton.nvim",
    event = "VeryLazy",
    lazy = true,
    cmd = "CellularAutomaton",
  }
}
