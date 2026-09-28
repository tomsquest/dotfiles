-- Personal configuration, loaded at the end of `init.lua` (kickstart.nvim)

-- Light theme
vim.cmd.colorscheme 'tokyonight-day'

-- mini.ai: `s` for the nearest surrounding, whatever the kind: brackets or quotes (eg. `cis`, `dis`, `yas`)
-- Replaces the built-in `s` (sentence) textobject
MiniAi.config.custom_textobjects = vim.tbl_extend('force', MiniAi.config.custom_textobjects or {}, {
  s = { { '%b()', '%b[]', '%b{}', "%b''", '%b""', '%b``' }, '^.().*().$' },
})

-- Don't wrap long lines, but show a symbol when wrapping is enabled
vim.o.wrap = false
vim.o.showbreak = '↳ '
vim.keymap.set('n', '<leader>w', function() vim.o.wrap = not vim.o.wrap end, { desc = 'Toggle line [W]rap' })

-- Save with ctrl+s (nvim disables the terminal flow control, no need for `stty -ixon`)
vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', '<Cmd>update<CR>', { desc = 'Save file' })

-- Move lines (or the selection) up and down with ctrl+up/down
require('mini.move').setup {
  mappings = {
    up = '<C-Up>', down = '<C-Down>', left = '', right = '',
    line_up = '<C-Up>', line_down = '<C-Down>', line_left = '', line_right = '',
  },
}

-- Reopen a file at the last position
vim.api.nvim_create_autocmd('BufReadPost', {
  desc = 'Restore the cursor position',
  group = vim.api.nvim_create_augroup('custom-last-position', { clear = true }),
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    if mark[1] > 1 and mark[1] <= vim.api.nvim_buf_line_count(args.buf) then vim.api.nvim_win_set_cursor(0, mark) end
  end,
})

-- Reload the file when it was modified by another program (`autoread` is on by default)
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter' }, {
  desc = 'Check if the file was modified outside of nvim',
  group = vim.api.nvim_create_augroup('custom-checktime', { clear = true }),
  command = 'checktime',
})
