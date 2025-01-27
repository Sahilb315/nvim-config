
return {
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  config = function()
    -- Set up Mason for installing LSPs and other tools
    require("mason").setup({
      ui = {
        border = "rounded", -- Optional, change the border style of Mason UI
      },
    })

    -- Set up mason-lspconfig to automatically install the LSPs for specified languages
    require("mason-lspconfig").setup({
      ensure_installed = { 
        "lua_ls",  -- Lua
        "gopls",   -- Go
        "tsserver", -- TypeScript/JavaScript
        "eslint",  -- ESLint (for linting JS/TS)
        "html",    -- HTML
        "cssls",   -- CSS
        "jsonls",  -- JSON
      },
      automatic_installation = true, -- Automatically install missing servers when detected
    })

    -- Configure the LSP servers with nvim-lspconfig
    local lspconfig = require("lspconfig")

    -- Lua LSP
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          workspace = { library = vim.api.nvim_get_runtime_file("", true) },
          telemetry = { enable = false },
        },
      },
    })

    -- Go LSP
    lspconfig.gopls.setup({})

    -- TypeScript/JavaScript LSP (tsserver)
    lspconfig.tsserver.setup({
      on_attach = function(client, bufnr)
        -- Disable tsserver formatting if you use another tool like prettier
        client.server_capabilities.documentFormattingProvider = false
      end,
    })

    -- ESLint LSP for JavaScript/TypeScript linting
    lspconfig.eslint.setup({
      on_attach = function(client, bufnr)
        -- ESLint-specific behavior
        client.server_capabilities.documentFormattingProvider = true
      end,
    })

    -- Optional: Additional configurations for other languages like HTML, CSS, JSON
    lspconfig.html.setup({})
    lspconfig.cssls.setup({})
    lspconfig.jsonls.setup({})
  end
}

