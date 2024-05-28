return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  keys = { {
    ";op",
    ":MarkdownPreviewToggle<CR>",
    desc = " Markdown Preview Toggle"
  } },
  config = function()
    vim.cmd([[do FileType]])
  end,
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
}
