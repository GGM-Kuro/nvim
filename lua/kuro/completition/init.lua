local cmp = require "cmp"
local lspkind = require "lspkind"
local compare = require "cmp.config.compare"
local cmp_mappings = cmp.mapping.preset.insert({
  ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ["<C-CR>"] = cmp.mapping.complete(),
  ["<C-e>"] = cmp.mapping.abort(),
  ["<C-y>"] = cmp.mapping.confirm({
    select = true,
    behavior = cmp.ConfirmBehavior.Replace
  }),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings["<Tab>"] = vim.NIL
cmp_mappings["<S-Tab>"] = vim.NIL

---@diagnostic disable-next-line: missing-fields
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "luasnip" },
    { name = "codeium" },
    {
      name = "buffer",
      keyword_length = 4,
      option = {
        get_bufnrs = function()
          local bufs = {}
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local bufnr = vim.api.nvim_win_get_buf(win)
            if vim.api.nvim_buf_get_option(bufnr, "buftype") ~= "terminal" then
              bufs[bufnr] = true
            end
          end
          return vim.tbl_keys(bufs)
        end,
      }
    },
  },
  formatting = {
    fields = {'menu','abbr','kind'},
    format = lspkind.cmp_format {
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[  ]",
        codeium = "[ﮧ  ]",
        nvim_lua = "[api]",
        path = "[pth]",
        luasnip = "[snp]",
        ["vim-dadbod-completion"] = "[DB ]",
      },
    },
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      compare.kind,
      compare.sort_text,
    },
  },



  mapping = cmp_mappings,
})
lspkind.init({
  symbol_map = { Codeium = "󰚩" }
})
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

-- Snippets will load from LSP but this makes sure to
-- load local and plugin snippets ASAP
require("luasnip.loaders.from_vscode").lazy_load()
