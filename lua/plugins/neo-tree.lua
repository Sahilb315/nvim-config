return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    -- Optional image support: "3rd/image.nvim"
  },
  config = function() 
    require("neo-tree").setup({
      close_if_last_window = true,
      window = {
        width = 26,
      },
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
    })

    vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { noremap = true, silent = true, desc = "Toggle Neo-tree" })
  end,
}

