vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

local function run_and_copy(cmd)
  local output = vim.fn.system(cmd)
  vim.fn.setreg('+', output)
  print("Output copied to clipboard:\n" .. output)
end
vim.keymap.set('n', '<leader>cc', function() run_and_copy('cargo check') end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cr', function() run_and_copy('cargo run') end, { noremap = true, silent = true })

