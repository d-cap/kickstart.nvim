-- Install the project extension natively
vim.pack.add({ { src = 'https://github.com/nvim-telescope/telescope-project.nvim' } })

-- Load the extension into Telescope
require('telescope').load_extension('project')

-- Define keymap for opening the project switcher
vim.keymap.set('n', '<leader>sp', function()
  require('telescope').extensions.project.project({})
end, { desc = '[S]earch [P]roject' })
