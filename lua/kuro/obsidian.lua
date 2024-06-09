require("obsidian").setup({
  workspaces = {
    {
      name = "GoodGameMonkey",
      path = "$HOME/Desktop/kuro/Notes/Mind/",
      overrides = {
        notes_subdir = 'Input'
      }
    }, {
    name = "Aethernum",
    path = "$HOME/Desktop/kuro/Notes/Aethernum",
    overrides = {
      notes_subdir = '📥entrada'
    }
  }
  },
  completion = {
    nvim_cmp = true,
    min_chars = 2,
  },
  attachments = {
    img_folder = "Archive",
  },
  daily_notes = {
    -- Optional, if you keep daily notes in a separate directory.
    folder = "$HOME/Desktop/kuro/Notes/Journal/",
    -- Optional, if you want to change the date format for the ID of daily notes.
    date_format = "%Y-%m-%d",
    -- Optional, if you want to change the date format of the default alias of daily notes.
    alias_format = "%B %-d, %Y",
    -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
    template = nil
  },
  mappings = {
    -- "Obsidian follow"
    [";of"] = {
      action = function()
        return require("obsidian").util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true , "Follow Link"},
    },
    -- Toggle check-boxes "obsidian done"
    [";od"] = {
      action = ":ObsidianToggleCheckbox<CR>",
      opts = { buffer = true , desc = "Toggle checkbox"},
    },
    [";ow"] = {
      action = ":ObsidianWorkspace<CR>",
      opts = { buffer = true , desc = "Change workspace"},
    },
    [";ot"] = {
      action = ":ObsidianToday<CR>",
      opts = { buffer = true, desc = "Open Today's note"},
    },
    -- Create a new newsletter issue
    [";onn"] = {
      action = ":ObsidianNew<CR>",
      opts = { buffer = true , desc = "New note"},
    },
    [";ont"] = {
      action = ":ObsidianTemplate<CR>",
      opts = { buffer = true , desc = "New template"},
    },
  },
  note_frontmatter_func = function(note)
    -- This is equivalent to the default frontmatter function.
    local out = { id = note.id, aliases = note.aliases, tags = note.tags }

    -- `note.metadata` contains any manually added fields in the frontmatter.
    -- So here we just make sure those fields are kept in the frontmatter.
    if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end
    return out
  end,

  note_id_func = function(title)
    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
    -- In this case a note with the title 'My new note' will be given an ID that looks
    -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
    local suffix = ""
    if title ~= nil then
      -- If title is given, transform it into valid file name.
      suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      -- If title is nil, just add 4 random uppercase letters to the suffix.
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    return tostring(os.time()) .. "-" .. suffix
  end,

  templates = {
    subdir = "Templates",
    date_format = "%Y-%m-%d-%a",
    gtime_format = "%H:%M",
    tags = "Input",
  },
}
)
