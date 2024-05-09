local lsp = require("lsp-zero")
require("luasnip.loaders.from_vscode").lazy_load()
lsp.preset("recommended")
lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
  'pyright',
  'lua',
  'dart'
})

--require('luasnip').filetype_extend("dart", { "flutter" })
-- Fix Undefined global 'vim'
lsp.nvim_workspace()

require('lspkind').init({
    -- DEPRECATED (use mode instead): enables text annotations
    --
    -- default: true
    -- with_text = true,

    -- defines how annotations are shown
    -- default: symbol
    -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
    mode = 'symbol_text',

    -- default symbol map
    -- can be either 'default' (requires nerd-fonts font) or
    -- 'codicons' for codicon preset (requires vscode-codicons font)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = "󰉿",
      Method = "󰆧",
      Function = "󰊕",
      Constructor = "",
      Field = "󰜢",
      Variable = "󰀫",
      Class = "󰠱",
      Interface = "",
      Module = "",
      Property = "󰜢",
      Unit = "󰑭",
      Value = "󰎠",
      Enum = "",
      Keyword = "󰌋",
      Snippet = "",
      Color = "󰏘",
      File = "󰈙",
      Reference = "󰈇",
      Folder = "󰉋",
      EnumMember = "",
      Constant = "󰏿",
      Struct = "󰙅",
      Event = "",
      Operator = "󰆕",
      TypeParameter = "",
    },
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = '',
    warn = '',
    hint = '󰋗',
    info = ''
  }
})

lsp.on_attach(function(client, bufnr)
  local map_lsp = function(key, f, opts)
    local default = {
      mode = "n",
      options = {},
      buffer = bufnr,
      desc = nil,
    }
    opts = opts or {}
    opts = vim.tbl_deep_extend("force", default, opts or {})

    local rhs = function()
      f(opts.options)
    end

    local map_options = {
      remap = false,
      silent = true,
    }
    if opts.buffer then
      map_options.buffer = opts.buffer
    end
    if opts.desc then
      map_options.desc = "Lsp:" .. opts.desc
    end

    vim.keymap.set(opts.mode, key, rhs, map_options)
  end


  map_lsp("gd", vim.lsp.buf.definition, { desc = 'Definition' })
  map_lsp("gD", vim.lsp.buf.declaration, { desc = 'Declaration' })
  map_lsp("go", vim.lsp.buf.type_definition, { desc = 'Type Definition' })
  map_lsp("gr", vim.lsp.buf.references, { desc = 'References' })
  map_lsp("gs", vim.lsp.buf.signature_help, { desc = 'Help' })
  map_lsp("K", vim.lsp.buf.hover, {})
  map_lsp("<leader>vws", vim.lsp.buf.workspace_symbol, { desc = 'Workspace Symbol' })
  map_lsp("gl", vim.diagnostic.open_float, { desc = ' Diagnostics' })
  map_lsp("[d", vim.diagnostic.goto_next, { desc = ' diagnostic' })
  map_lsp("]d", vim.diagnostic.goto_prev, { desc = ' diagnostic' })
  map_lsp("<leader>ca", vim.lsp.buf.code_action, { desc = ' Code Actions' })
  map_lsp("<leader>cr", vim.lsp.buf.references, { desc = 'View references' })
  map_lsp("<C-S-H>", vim.lsp.buf.signature_help, {})
  map_lsp("<leader>f", vim.lsp.buf.format, { desc = 'formatting' })
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})
