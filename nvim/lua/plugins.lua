require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'kyazdani42/nvim-web-devicons'	-- incons for lualine
	use 'nvim-lualine/lualine.nvim'		-- status bar for neovim
	use 'preservim/nerdtree'			-- NerdTree for the folder navigation
	use 'mechatroner/rainbow_csv'		-- Rainbowcsv
	use 'preservim/tagbar'				-- Tag bar: List of methods and other stuff
	use 'folke/tokyonight.nvim'			-- colorscheme
	use 'neovim/nvim-lspconfig'			-- Configurations for Nvim LSP
	use 'williamboman/nvim-lsp-installer' -- Lsp easy to install new servers
	use 'ms-jpq/coq_nvim'				-- Autocomplete 
	use 'ms-jpq/coq.artifacts'			-- Autocomplete shortcuts 
	use 'nvim-lua/popup.nvim'			-- Necessary for Telescope
	use 'nvim-lua/plenary.nvim'			-- Necessary for Telescope
	use 'nvim-lua/telescope.nvim'		-- Fuzzy finder
	use 'nvim-treesitter/nvim-treesitter' -- Tree seitter
	use 'iamcco/markdown-preview.nvim' -- Markdown preview
	use {
    'jedrzejboczar/toggletasks.nvim',	-- Manage task as VSCODE
    requires = {
        'akinsho/toggleterm.nvim',
	    }
	}
	use 'startup-nvim/startup.nvim'		-- Start up for neovim the logo ecc 
	use 'mfussenegger/nvim-dap'			-- Debugger interface 	
	use 'rcarriga/nvim-dap-ui'			-- Debugger UI
end)
-- Start the plugin when necessary like autocompletition and lsp
require("nvim-lsp-installer").setup()
local lsp = require('lspconfig')
local coq = require('coq')

-- assign lsp server to clang 
lsp.clangd.setup(coq.lsp_ensure_capabilities())
lsp.cmake.setup(coq.lsp_ensure_capabilities())
lsp.sumneko_lua.setup{coq.lsp_ensure_capabilities{}}

-- Lualine config 
require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = false,
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {'filename'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	extensions = {}
}
require'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all"
	ensure_installed = { "cpp", "lua","cmake"},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	highlight = {
		-- `false` will disable the whole extension
		enable = true,
	},
}
require('telescope').setup {
	pickers = { find_files = { hidden = true}}
}

require('toggletasks').setup {
    debug = false,
    silent = false,  -- don't show "info" messages
    short_paths = true,  -- display relative paths when possible
    -- Paths (without extension) to task configuration files (relative to scanned directory)
    -- All supported extensions will be tested, e.g. '.toggletasks.json', '.toggletasks.yaml'
    search_paths = {
        'toggletasks',
        '.toggletasks',
        '.nvim/toggletasks',
    },
    -- Directories to consider when searching for available tasks for current window
    scan = {
        global_cwd = true,  -- vim.fn.getcwd(-1, -1)
        tab_cwd = true,     -- vim.fn.getcwd(-1, tab)
        win_cwd = true,     -- vim.fn.getcwd(win)
        lsp_root = true,    -- root_dir for first LSP available for the buffer
        dirs = {},          -- explicit list of directories to search
    },
    -- Language server priorities when selecting lsp_root (default is 0)
    lsp_priorities = {
        ['null-ls'] = -10,
    },
    -- Default values for task configuration options (available options described later)
    defaults = {
        close_on_exit = false,
        hidden = true,
    },
    -- Configuration of telescope pickers
    telescope = {
        spawn = {
            open_single = true,  -- auto-open terminal window when spawning a single task
            show_running = false, -- include already running tasks in picker candidates
            -- Replaces default select_* actions to spawn task (and change toggleterm
            -- direction for select horiz/vert/tab)
            mappings = {
                select_float = '<C-f>',
                spawn_smart = '<C-a>',  -- all if no entries selected, else use multi-select
                spawn_all = '<M-a>',    -- all visible entries
                spawn_selected = nil,   -- entries selected via multi-select (default <tab>)
            },
        },
        -- Replaces default select_* actions to open task terminal (and change toggleterm
        -- direction for select horiz/vert/tab)
        select = {
            mappings = {
                select_float = '<C-f>',
                open_smart = '<C-a>',
                open_all = '<M-a>',
                open_selected = nil,
                kill_smart = '<C-q>',
                kill_all = '<M-q>',
                kill_selected = nil,
                respawn_smart = '<C-s>',
                respawn_all = '<M-s>',
                respawn_selected = nil,
            },
        },
    },
}
require('telescope').load_extension('toggletasks')

require("startup").setup({
	theme = "dashboard", -- put theme name here
})
