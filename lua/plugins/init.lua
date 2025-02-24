local cmp = require "cmp"

return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "MysticalDevil/inlay-hints.nvim",
    event = "LspAttach",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("inlay-hints").setup()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require "nvim-treesitter.configs"

      configs.setup {
        ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@class ibl.config
    opts = {
      indent = { char = "┊" },
    },
  },

  -- copilot
  {
    "zbirenbaum/copilot.lua",
    enabled = true,
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = true },
      filetypes = { ["*"] = true },
    },
  },

  {
    "simrat39/symbols-outline.nvim",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  {
    "nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        opts = {},
      },
    },
    ---@class opts cmp.ConfigSchema
    opts = function(_, opts)
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "copilot" } }))
      opts.mapping = cmp.config.mapping(vim.list_extend(opts.mapping, { ["<C-]>"] = cmp.mapping.select_prev_item() }))
      opts.mapping = cmp.config.mapping(vim.list_extend(opts.mapping, { ["<C-[>"] = cmp.mapping.select_next_item() }))
    end,
  },
}
