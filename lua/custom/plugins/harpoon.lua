-- 1. Install the plugin and its dependencies natively
vim.pack.add({
  { src = 'https://github.com/ThePrimeagen/harpoon' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
})

-- 2. Configure it immediately
-- (Since config = true just ran the default setup)
require('harpoon').setup({})

-- 3. Bind the keys natively
vim.keymap.set('n', '<leader>a', "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = 'Mark file with harpoon' })
vim.keymap.set('n', '<C-h>', "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { desc = 'Go to first harpoon mark' })
vim.keymap.set('n', '<C-j>', "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { desc = 'Go to second harpoon mark' })
vim.keymap.set('n', '<C-k>', "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", { desc = 'Go to third harpoon mark' })
vim.keymap.set('n', '<C-l>', "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", { desc = 'Go to forth harpoon mark' })
vim.keymap.set('n', '<leader>ha', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = 'Show harpoon marks' })
