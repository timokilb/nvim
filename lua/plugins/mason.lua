-- lua/plugins/lsp.lua
return {
  -- Mason: tool installer
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason-LSPConfig: makes mason + lspconfig play nice
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "pyright" }, -- install Pyright for Python
      }
    end,
  },

  -- LSPConfig: actually configures the servers
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "iguanacucumber/magazine.nvim", -- completion (nvim-cmp fork)
      "hrsh7th/cmp-nvim-lsp",         -- LSP completion source
      "L3MON4D3/LuaSnip",             -- snippets (required by magazine)
    },
    config = function()
      local lspconfig = require("lspconfig")

      -- Setup capabilities so LSP and magazine.nvim work together
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Python LSP setup
      lspconfig.pyright.setup {
        capabilities = capabilities,
      }

      -- Magazine (completion) setup
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
        }),
      })
    end,
  },
}

