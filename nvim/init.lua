-- Load the global parametres for vim and the plugins
require('global')
-- Packet manager set-up --
vim.cmd('packadd packer.nvim')
require'packer'
-- Autoreload plugin 
vim.cmd([[
   augroup packer_user_config
     autocmd!
     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
   augroup end
 ]])
-- Load the plugin present in the lua/plugins.lua
require('plugins')
-- Load the mapping present in the lua/mapping.lua
require('mapping')
