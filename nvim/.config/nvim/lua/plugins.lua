return {
  { "catppuccin/nvim",
    name = "catppuccin", 
    priority = 1000,
    config = function()
      vim.cmd("colorscheme catppuccin")
    end,
  },  
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  { "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 2000,
      set_dark_mode = function()
        vim.api.nvim_set_option("background", "dark")
      end,
      set_light_mode = function()
        vim.api.nvim_set_option("background", "light")
      end,
    },
  },
  "neovim/nvim-lspconfig",
  "simrat39/rust-tools.nvim"
}
