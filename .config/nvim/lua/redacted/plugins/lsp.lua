return {
  {
    "neovim/nvim-lspconfig",
    enabled = false,
    dependencies = {
      {"folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = {"vim%.uv"} },
          },
        },
      },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      -- Mason Setup and LSP Installation
      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "lua_ls" }, -- Install both LSPs here
      })

      -- Lua LSP Configuration
      require("lspconfig").lua_ls.setup { capabilities = capabilities}

      -- Pyright LSP Configuration
      require("lspconfig").pyright.setup({
	capabilties = capabilities,
        settings = {
          pyright = {
            typeCheckingMode = "standard", -- or "basic", "strict"
          },
          python = {
            analysis = {
              venvPath = ".",
              venv = ".venv",
            },
          },
        },
      })
      -- Enable diagnostics in Insert mode
      -- This needs to be set on the global diagnostic configuration.
      -- LazyVim provides a way to configure this via the 'opts' table of nvim-lspconfig
      vim.diagnostic.config({
        update_in_insert = false,-- Update diagnostics in Insert mode
        virtual_text = true, -- Ensure inline messages are visible
        -- You can add other diagnostic options here as needed
      })


      -- Keybindings and other LSP related configurations
      -- (e.g., for completion, diagnostics, etc.) can be added here
      -- using plugins like nvim-cmp and luasnip.
    end,
  },
}

