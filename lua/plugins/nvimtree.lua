return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      view = {
        width = 30,
        adaptive_size = true, -- automatically adjusts width
        number = true,        -- show line numbers in tree
        relativenumber = true,
      },
      renderer = {
        group_empty = true,
        highlight_git = true,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
      filters = {
        dotfiles = false,     -- changed to false to show hidden files
        custom = { "^.git$" } -- hide .git folder
      },
      git = {
        enable = true,
        ignore = false,       -- show files that are in .gitignore
      },
      actions = {
        open_file = {
          quit_on_open = false, -- don't close tree when opening a file
          resize_window = true, -- resize tree when opening a file
        },
      },
    })

    -- Keymaps
    vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>', { silent = true, desc = "Toggle NvimTree" })
    vim.keymap.set('n', '<leader>tr', ':NvimTreeRefresh<CR>', { silent = true, desc = "Refresh NvimTree" })
  end
}

