local dashboard = require("alpha.themes.dashboard")
local logo = [[
              █████╗  ██████╗ ███╗   ███╗
	           ██╔════╝ ██╔════╝ ████╗ ████║
	           ██║  ███╗██║  ███╗██╔████╔██║
	           ██║   ██║██║   ██║██║╚██╔╝██║
	           ╚██████╔╝╚██████╔╝██║ ╚═╝ ██║
	            ╚═════╝  ╚═════╝ ╚═╝     ╚═╝
	███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
	████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
	██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
	██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
	██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
	╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
    ]]

dashboard.section.header.val = vim.split(logo, "\n")
dashboard.section.buttons.val = {
  dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
  dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
  dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
  -- dashboard.button("c", " " .. " Config", ":Oil --float " .. os.getenv("MYVIMRC") .. "<CR>"),
  dashboard.button("c", " " .. " Config", ":Telescope file_browser path=$MYVIMRC/lua/ <CR>"),
  -- dashboard.button(".", " " .. " Dotfiles", ":Oil --float " .. os.getenv("DOTFILES_PATH") .. "<CR>"),
  dashboard.button(".", " " .. " Dotfiles", ":Telescope file_browser path=$DOTFILES_PATH <CR>"),
  -- dashboard.button("p", " " .. " Repos", ":Telescope file_browser path=$Proyects <CR>"),
  dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
  dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}
for _, button in ipairs(dashboard.section.buttons.val) do
  button.opts.hl = "AlphaButtons"
  button.opts.hl_shortcut = "AlphaShortcut"
end
dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.buttons.opts.hl = "AlphaButtons"
dashboard.section.footer.opts.hl = "AlphaFooter"
dashboard.opts.layout[1].val = 8

return dashboard
