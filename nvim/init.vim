call plug#begin('~/.local/share/nvim/plugged')

Plug 'vague2k/vague.nvim'
Plug 'stevearc/oil.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'pocco81/true-zen.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'numToStr/Navigator.nvim'
Plug 'iabdelkareem/csharp.nvim'
Plug 'GustavEikaas/easy-dotnet.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'OrangeT/vim-csharp'
Plug 'lewis6991/gitsigns.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'brianaung/compl.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'max397574/startup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'


call plug#end()


lua require("startup").setup({theme = "dashboard"})
lua require("toggleterm").setup()

lua << EOF
require("mason").setup()
require("mason-lspconfig").setup({
})


EOF



lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

        -- For `mini.snippets` users:
        -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
        -- insert({ body = args.body }) -- Insert at cursor
        -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
        -- require("cmp.config").set_onetime({ sources = {} })
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
  -- Set configuration for specific filetype.
  --[[ cmp.setup.filetype('gitcommit', { sources = cmp.config.sources({ { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]--

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

EOF



lua << EOF
require('gitsigns').setup {
  signs = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
  },
}

EOF


lua << EOF
local lspconfig = require("lspconfig")

lspconfig.omnisharp.setup({
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/omnisharp" },
    enable_roslyn_analyzers = true,
    enable_import_completion = true,
    organize_imports_on_format = true,
})
EOF


lua << EOF
require('Navigator').setup()
EOF

lua << EOF
require('oil').setup()
EOF



nnoremap - :lua require('oil').open()<CR>
nnoremap <leader>br :lua require("easy-dotnet").build_project()<CR>
nnoremap <leader>rr :lua require("easy-dotnet").run_project()<CR>
nnoremap <leader>dr :lua require("easy-dotnet").debug_project()<CR>
nnoremap <leader>tt :lua require("easy-dotnet").test_project()<CR>
nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

lua << EOF
local lspconfig = require('lspconfig')

lspconfig.pyright.setup{}


local on_attach = function(client, bufnr)
  local buf_set_keymap = vim.api.nvim_buf_set_keymap
  local opts = { noremap=true, silent=true }

  buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

lspconfig.pyright.setup{ on_attach = on_attach }
EOF

lua << EOF
require('lspconfig').gopls.setup{}
EOF

lua << EOF
require('lspconfig').lua_ls.setup{
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
      diagnostics = { globals = {'vim'} },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
    }
  }
}
EOF

lua << EOF
require('lspconfig').ts_ls.setup{
    on_attach = function(client, bufnr)
        local opts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    end
}
EOF




set number
set relativenumber
set tabstop=2			
set noswapfile
set guicursor=i:block


nnoremap - :Oil<CR>
nnoremap <A-h> :NavigatorLeft<CR>
nnoremap <A-l> :NavigatorRight<CR>
nnoremap <A-k> :NavigatorUp<CR>
nnoremap <A-j> :NavigatorDown<CR>
nnoremap <A-p> :NavigatorPrevious<CR>

tnoremap <A-h> <C-\><C-n>:NavigatorLeft<CR>
tnoremap <A-l> <C-\><C-n>:NavigatorRight<CR>
tnoremap <A-k> <C-\><C-n>:NavigatorUp<CR>
tnoremap <A-j> <C-\><C-n>:NavigatorDown<CR>
tnoremap <A-p> <C-\><C-n>:NavigatorPrevious<CR>


colorscheme vague
