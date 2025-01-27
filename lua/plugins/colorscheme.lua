return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("tokyonight").setup({
      style = "night",
      styles = {
        functions = {}
      },
      on_colors = function(colors)
        colors.hint = colors.orange
        colors.error = "#ff0000"
      end,
      transparent = true,
    })

    vim.cmd("colorscheme tokyonight")

    vim.cmd([[
      hi NeoTreeNormal guibg=NONE
      hi NeoTreeDimText guibg=NONE
      hi NeoTreeEndOfBuffer guibg=NONE
      hi NeoTreeTitle guibg=NONE
      hi NeoTreeRootName guibg=NONE
      hi NeoTreeTab guibg=NONE
    ]])

    vim.cmd([[
      hi NeoTreeNormalNC guibg=NONE
      hi NeoTreeDimTextNC guibg=NONE
      hi NeoTreeEndOfBufferNC guibg=NONE
      hi NeoTreeTitleNC guibg=NONE
      hi NeoTreeRootNameNC guibg=NONE
      hi NeoTreeTabNC guibg=NONE
    ]])

    vim.cmd([[
      hi NeoTreeWinSeparator guifg=#444444 guibg=NONE gui=bold cterm=bold
      hi NeoTreeWinSeparatorNC guifg=#444444 guibg=NONE gui=bold cterm=bold
    ]])

    vim.cmd([[
      hi NeoTreeTitle guifg=#888888 guibg=NONE gui=bold
      hi NeoTreeRootName guifg=#888888 guibg=NONE gui=bold
    ]])

  end
}

