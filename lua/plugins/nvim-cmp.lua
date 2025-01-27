return {
  "hrsh7th/nvim-cmp", -- Autocompletion plugin
  "hrsh7th/cmp-nvim-lsp", -- LSP completion source
  "hrsh7th/cmp-buffer", -- Buffer completion source
  "hrsh7th/cmp-path", -- Path completion source
  "hrsh7th/cmp-cmdline", -- Cmdline completion source
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,noinsert", -- Options for the completion menu
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body) -- Expand snippets using LuaSnip
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "cmdline" },
      },
    })

    -- Enable completion for command line
    cmp.setup.cmdline(":", {
      sources = {
        { name = "path" },
        { name = "cmdline" },
      },
    })
  end,
}
