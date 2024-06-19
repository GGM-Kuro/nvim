local cmp, lspkind, luasnip, compare = require "cmp", require "lspkind",
    require "luasnip", require "cmp.config.compare"

local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
luasnip.filetype_extend('htmldjango', { 'django' })


local cmp_mappings = cmp.mapping.preset.insert({
  ["<C-d>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ["<C-space>"] = cmp.mapping.complete(),
  ["<C-e>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.abort()
    elseif luasnip.choice_active() then
      luasnip.change_choice(1)
    else
      fallback()
    end
  end, { "i", "s" }),
  ["<C-y>"] = cmp.mapping.confirm({
    select = true,
    behavior = cmp.ConfirmBehavior.Replace
  }),
  ["<C-t>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item({
        behavior = cmp.SelectBehavior.Select
      })
    elseif luasnip.expand_or_jumpable() then
      luasnip.jump(-1)
    elseif vim.fn[ 'UltiSnips#CanJumpBackwards' ]() then
      cmp_ultisnips_mappings.jump_backwards(fallback)
    else
      fallback()
    end
  end, { "i", "s" }),
  ["<C-n>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item({
        behavior = cmp.SelectBehavior.Select
      })
    elseif luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    elseif vim.fn[ 'UltiSnips#CanJumpForwards' ]() then
      cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
    else
      fallback()
    end
  end, { "i", "s" }),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings["<Tab>"] = vim.NIL
cmp_mappings["<S-Tab>"] = vim.NIL

---@diagnostic disable-next-line: missing-fields
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },

  window = {
    completion = cmp.config.window.bordered({
      winhighlight = "Normal:WinBar,FloatBorder:WinBar,Search:None,CursorLine:PmenuThumb",
    }),
    documentation = cmp.config.window.bordered(),
  },

  sources = {
    { name = "codeium" },
    { name = "vim_snippets" },
    { name = "luasnip" },
    { name = "ultisnips" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "emoji" },
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
    fields = { 'menu', 'abbr', 'kind' },
    format = lspkind.cmp_format {
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[  ]",
        codeium = "[ﮧ  ]",
        nvim_lua = "[api]",
        path = "[pth]",
        luasnip = "[snp]",
        ultisnips = "[usn]",
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

  experimental = {
    ghost_text = true
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

luasnip.config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI",
})

-- Snippets will load from LSP but this makes sure to
-- load local and plugin snippets ASAP
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "/home/kuro/.local/share/nvim/lazy/vim-snippets/UltiSnips/htmldjango.snippets" } })
