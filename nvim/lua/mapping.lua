-- Key mapper helper function -- 
local key_mapper = function(mode, key, result,desc)
	vim.api.nvim_set_keymap(
	mode,
	key,
	result,
	{noremap = true, silent = true,desc=desc}
	)
end
-- leader definition space will be the leader comand
vim.g.mapleader = ' '
-- Key mapping --
key_mapper('', '<up>', '<nop>')
key_mapper('', '<down>', '<nop>')
key_mapper('', '<left>', '<nop>')
key_mapper('', '<right>', '<nop>')
key_mapper('n','<C-n>', ':NERDTree<CR>')
key_mapper('n','<C-t>',':NERDTreeToggle<CR>')
key_mapper('n','<C-f>',':NERDTreeFind<CR>')
key_mapper('n','<leader>m',':RainbowAlign<CR>')		-- Align csv files
key_mapper('n','<F8>',':TagbarToggle<CR>')			-- function minimap
key_mapper('','<leader>y','"+y')					-- nvim to clipboard
key_mapper('v','<leader>p','"+p')					-- paste from clipboard
key_mapper('','<leader><S-y>','"*y')				-- use this for xclip usage
key_mapper('v','<leader><S-p>','"*p')				-- use this for xclip usage	
-- FUZZY FINDER
key_mapper('n', '<C-p>', ':lua require"telescope.builtin".find_files()<CR>')
key_mapper('n', '<leader>fs', ':lua require"telescope.builtin".live_grep()<CR>')
key_mapper('n', '<leader>fh', ':lua require"telescope.builtin".help_tags()<CR>')
key_mapper('n', '<leader>fb', ':lua require"telescope.builtin".buffers()<CR>')
key_mapper('n','<leader>e', 'vim.diagnostic.open_float()<CR>')
key_mapper('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
key_mapper('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
key_mapper('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
key_mapper('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>')
key_mapper('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>')
key_mapper('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
key_mapper('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')
key_mapper('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
key_mapper('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>')
key_mapper('n', '<leader>af', ':lua vim.lsp.buf.code_action()<CR>')
key_mapper('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
-- Toggletask aka task of VScod-- Toggletask aka task of VScodee
key_mapper('n','<leader>st',':Telescope toggletasks spawn<CR>')
--debug 
key_mapper('n', '<F5>', ':lua require"dap".continue()<CR>')
key_mapper('n', '<F2>', ':lua require"dap".step_over()<CR>')
key_mapper('n', '<F3>', ':lua require"dap".step_into()<CR>')
key_mapper('n', '<F4>', ':lua require"dap".step_out()<CR>')
key_mapper('n', '<F6>', ':lua require"dap".terminate()<CR>')
key_mapper('n', '<leader>b', ':lua require"dap".toggle_breakpoint()<CR>')
key_mapper('n', '<leader>B', ':lua require"dap".set_breakpoint()<CR>')
key_mapper('n', '<leader>lp', ':lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
key_mapper('n', '<leader>dr', ':lua require"dap".repl.open()<CR>')
key_mapper('n', '<leader>dl', ':lua require"dap".run_last()<CR>')
key_mapper('n', '<leader>dc', ':lua require"dapui".close()<CR>')

