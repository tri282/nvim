--- SOME KEYBINDS START

--- ctrl + p: open file list
--- ctrl + f + g: live grep + jump
--- ctrl + n: show file system, default: on left

--- ctrl + d + t: breakpoint for debugging
--- ctrl + d + c: continue debugging

--- SOME KEYBINDS END

--- LAZY
--- lazy is a plugins/package manager for Neovim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

--- lazy setup
require("lazy").setup({
	require("plugins.neotree"),
	require("plugins.catppuccin"),
	require("plugins.lualine"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.lsp"),
	require("plugins.conform"),
	require("plugins.blink_cmp"),
	require("plugins.debugging"),
	require("plugins.gitsigns"),
	require("plugins.comments"),
})

require("vim-options")

--- FORMATTING

--- default set numbers
vim.o.number = true

--- relative line numbers
vim.o.relativenumber = true

--- enable mouse mode
vim.o.mouse = "a"

--- hide mode since already configured the status
vim.o.showmode = false

--- sync nvim and OS's clipboard
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

--- break indent
vim.o.breakindent = true

--- case sensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

--- configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

--- set whitespace chars
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

--- show line number that cursor is on
vim.o.cursorline = true

--- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
--- instead raise a dialog asking if you wish to save the current file(s)
vim.o.confirm = true

--- highlight when yanking texts
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

--- switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
