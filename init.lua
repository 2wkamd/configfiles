-- o.syntax = true

local o = vim.opt
local g = vim.g
local k = vim.keymap
local map = vim.api.nvim_set_keymap
local fn = vim.fn
local cmd = vim.cmd


o.laststatus = 2
-- o.t_Co = 256
o.hlsearch = true
o.binary = true
o.list = true

-- o.set number

o.splitbelow = on
o.autoindent = true
o.clipboard = unnamed
o.display = lastline
o.mouse=""
g.mapleader = ","
g.t_ut = ''
-- g.g['polyglot_disabled'] = 'csv'
-- xnoremap p pgvy

-- Auto install plugin manager

o.grepprg='rg --vimgrep --column --line-number --no-heading --color=always --smart-case -- '

require "paq" {
    "savq/paq-nvim", -- Let Paq manage itself
    {'nvim-lualine/lualine.nvim',requires = { 'nvim-tree/nvim-web-devicons', opt = true }},
    {'morhetz/gruvbox'},
    {'nvim-tree/nvim-web-devicons'},
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    { "ibhagwan/fzf-lua", requires = { "nvim-tree/nvim-web-devicons" }},
    { 'nvim-tree/nvim-tree.lua', requires = {'nvim-tree/nvim-web-devicons'}},
    {'f-person/git-blame.nvim'},
    {"lukas-reineke/indent-blankline.nvim"},
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'}
}

vim.opt.background = 'dark'
vim.cmd('colorscheme gruvbox')
vim.cmd('syntax enable')


require('lualine').setup {
  options = { theme  ='powerline_dark'},


}


require('fzf-lua').setup{
  winopts = {
    border           = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
    fullscreen       = false,           -- start fullscreen?
    preview = {
     -- default     = 'bat',           -- override the default previewer?
      border         = 'noborder',        -- border|noborder, applies only to
      wrap           = 'nowrap',        -- wrap|nowrap
      hidden         = 'nohidden',      -- hidden|nohidden
      vertical       = 'down:40%',      -- up|down:size
      horizontal     = 'up:60%',     -- right|left:size
      layout         = 'horizontal',          -- horizontal|vertical|flex
      flip_columns   = 120,             -- #cols to switch to horizontal on flex
      title          = true,            -- preview border title (file/buf)?
      title_pos      = "center",        -- left|center|right, title alignment
      scrollbar      = 'float',         -- `false` or string:'float|border'
      scrolloff      = '-2',            -- float scrollbar offset from right
      scrollchars    = {'█', '' },      -- scrollbar chars ({ <full>, <empty> }
      delay          = 100,             -- delay(ms) displaying the preview
                                        -- prevents lag on fast scrolling
      },
  },

}

require("nvim-tree").setup()

require('gitblame').setup {
     --Note how the `gitblame_` prefix is omitted in `setup`
    enabled = false,
}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

--require("ibl").setup{
--enabled = false
--}

vim.opt.termguicolors = true
require("bufferline").setup{}

k.set("n", "<leader>d", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
k.set("n", "<leader>f", "<cmd>lua require('fzf-lua').grep()<CR>", { silent = true })
k.set("n", "<C-h>", "<cmd>lua require('fzf-lua').grep_cword()<CR>", { silent = true })
k.set("n", "<leader>m", "<cmd> NvimTreeToggle<CR>", {})
k.set("n", "<leader>s", "<cmd> GitBlameToggle<CR>", {})
k.set("n", "<leader>l", "<cmd>lua require('ibl').setup()<CR>", { silent = true })



k.set("n", "<C-t>", "<cmd>:tabnew<CR>", { silent = true })
k.set("n", "<C-d>", "<cmd>:bd<CR>", { silent = true })


k.set("n", "<C-b>", "<cmd>:bn<CR>", { silent = true })
k.set("n", "<leader>v", "<cmd>:bp<CR>", { silent = true })



--vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- plug {'mg979/vim-visual-multi', branch='master'}
-- plug {'preservim/tagbar'}
-- plug {'akinsho/toggleterm.nvim', tag='*'}

