 
vim.cmd [[packadd packer.nvim]]

-- this will check for packer, and auto install it if it isn't already installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local PACKER_BOOTSTRAP = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Have packer use a popup window
require('packer').init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
})

return require('packer').startup(function(use)
  -- Pluginssssssssss
  use 'wbthomason/packer.nvim'
  use 'edeneast/nightfox.nvim'
  use 'voldikss/vim-floaterm'
  use 'pocco81/auto-save.nvim'
  use 'preservim/nerdtree'
  use 'gpanders/editorconfig.nvim'
  use 'ryanoasis/vim-devicons'
  use 'feline-nvim/feline.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Automatically setup your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
