return {
  { "catppuccin/nvim",
    name = "catppuccin", 
    priority = 1000,
    config = function()
      vim.cmd("colorscheme catppuccin")
    end,
  },  
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  "vimpostor/vim-lumen",
  "neovim/nvim-lspconfig",
  "simrat39/rust-tools.nvim"
}
