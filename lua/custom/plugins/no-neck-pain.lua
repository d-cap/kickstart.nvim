-- Install the plugin natively
vim.pack.add({ { src = 'https://github.com/shortcuts/no-neck-pain.nvim' } })

-- Pass your options directly into the setup call instead of using an 'opts' key
require('no-neck-pain').setup({
  width = 130,
})

-- Handle your auto-enable post-startup autocommand
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    require('no-neck-pain').enable()
  end,
})
