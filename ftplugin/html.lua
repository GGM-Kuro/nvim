if string.match(vim.fn.expand("%:p"), "/templates/") then
      vim.cmd("echo 'Django Html'")
      vim.bo.filetype = "htmldjango"
      vim.cmd("UltiSnipAddFiletypes htmldjango")
    end
