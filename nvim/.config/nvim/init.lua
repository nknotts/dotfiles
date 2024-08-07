--[[ init.lua ]]

require("config.lazy")

vim.g.mapleader = ","
vim.g.localleader = "\\"

vim.opt.number = true
vim.cmd.colorscheme "catppuccin"
vim.opt.cursorline = true
vim.opt.colorcolumn = "72"

require'lazy'.setup {
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  checker = { enabled = true },
}


require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c", "bash", "lua", "vim", "vimdoc", "rust", "go", "cpp", "python", "markdown", "markdown_inline" },

  highlight = {
    enable = true,
  }
}

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

require("auto-dark-mode").setup({ update_interval = 3000 })


