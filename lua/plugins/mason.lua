return {
  {
    "williamboman/mason.nvim",
    configs = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    configs = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "pyright" },
      }
    end,
  },

  {
    "neovim/nvim-lspconfig",
    version = "0.11.0",  -- future-proof
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "iguanacucumber/magazine.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    configs = function()
      local lspconfig = vim.lsp.config  -- new API
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Python LSP
      lspconfig.pyright.setup {
        capabilities = capabilities,
      }

      -- Magazine / CMP setup
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
