local cmd = vim.cmd
local fn = vim.fn
local opt = vim.o
local g = vim.g

-- <leader> key. Defaults to `\`. Some people prefer space.
g.mapleader = ' '
g.maplocalleader = ' '

cmd.syntax('on')
cmd.syntax('enable')
opt.compatible = false

-- Enable true colour support
if fn.has('termguicolors') then
  opt.termguicolors = true
end

-- See :h <option> to see what the options do
g.editorconfig = true

-- Search down into subfolders
opt.path = vim.o.path .. '**'
opt.showmatch = true -- Highlight matching parentheses, etc
opt.incsearch = true
opt.hlsearch = true

opt.laststatus = 3 -- global statusline
opt.showmode = false

opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

-- opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
-- opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.timeoutlen = 400
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- optimizations
opt.lazyredraw = true
opt.clipboard = "unnamedplus"

-- spelling
opt.spell = true
opt.spelllang = 'en'

-- vim folds
opt.foldenable = true

-- History
opt.cmdheight = 0 -- leave no section for cmd bar
opt.history = 2000

-- number formats
opt.nrformats = 'bin,hex' -- 'octal'

-- opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]


-- :Diagnostics {{{
local function prefix_diagnostic(prefix, diagnostic)
  return string.format(prefix .. ' %s', diagnostic.message)
end

local sign = function(opts)
  fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = '',
  })
end

-- Requires Nerd fonts
sign { name = 'DiagnosticSignError', text = '󰅚' }
sign { name = 'DiagnosticSignWarn', text = '⚠' }
sign { name = 'DiagnosticSignInfo', text = 'ⓘ' }
sign { name = 'DiagnosticSignHint', text = '󰌶' }

vim.diagnostic.config {
  virtual_text = {
    prefix = '',
    format = function(diagnostic)
      local severity = diagnostic.severity
      if severity == vim.diagnostic.severity.ERROR then
        return prefix_diagnostic('󰅚', diagnostic)
      end
      if severity == vim.diagnostic.severity.WARN then
        return prefix_diagnostic('⚠', diagnostic)
      end
      if severity == vim.diagnostic.severity.INFO then
        return prefix_diagnostic('ⓘ', diagnostic)
      end
      if severity == vim.diagnostic.severity.HINT then
        return prefix_diagnostic('󰌶', diagnostic)
      end
      return prefix_diagnostic('■', diagnostic)
    end,
  },
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
}
-- }}}

-- vim.opt.colorcolumn = '100'

-- Native plugins
-- cmd.filetype('plugin', 'indent', 'on')
-- cmd.packadd('cfilter') -- Allows filtering the quickfix list with :cfdo

-- let sqlite.lua (which some plugins depend on) know where to find sqlite
-- vim.g.sqlite_clib_path = require('luv').os_getenv('LIBSQLITE')
