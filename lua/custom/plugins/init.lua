-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { -- Harpoon
    'ThePrimeagen/harpoon',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = true,
    keys = {
      { '<leader>a',  "<cmd>lua require('harpoon.mark').add_file()<cr>",        desc = 'Mark file with harpoon' },
      { '<C-h>',      "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",         desc = 'Go to first harpoon mark' },
      { '<C-j>',      "<cmd>lua require('harpoon.ui').nav_file(2)<cr>",         desc = 'Go to second harpoon mark' },
      { '<C-k>',      "<cmd>lua require('harpoon.ui').nav_file(3)<cr>",         desc = 'Go to third harpoon mark' },
      { '<C-l>',      "<cmd>lua require('harpoon.ui').nav_file(4)<cr>",         desc = 'Go to forth harpoon mark' },
      { '<leader>ha', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = 'Show harpoon marks' },
    },
  },

  { -- Undotree
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
    end,
  },

  { -- Oil
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup {
        columns = { 'icon' },
        keymaps = {
          ['<C-h>'] = false,
          ['<M-h>'] = 'actions.select_split',
        },
        view_options = {

          show_hidden = true,
        },
      }

      -- Open parent directory in current window
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

      -- Open parent directory in floating window
      vim.keymap.set('n', '<space>-', require('oil').toggle_float)
    end,
  },

  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        width = 120,
      },
      plugins = {
        enabled = true
      }
    },
    --config = function()
    --  vim.cmd([[autocmd VimEnter * :ZenMode]])
    --end
  },
}
