vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, noremap = true })
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>R", ":source $HOME/labs/configs/cursor/init.lua<cr>", { silent = true })
-- sends the yanked text to the system clipboard
vim.keymap.set({ "n", "x" }, "y", '"+y', { noremap = true, silent = true })
-- hightlights yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})
vim.opt.relativenumber = true

local vscode = require("vscode")
print(vscode.call("_ping")) -- outputs: pong

vim.keymap.set("n", "<leader>dn", function()
	vscode.action("editor.action.marker.next")
end)

vim.keymap.set("n", "<leader>dp", function()
	vscode.action("editor.action.marker.prev")
end)

vim.keymap.set("n", "<leader>rn", function()
	vscode.action("editor.action.rename")
end)

--
-- FILES
--
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", function()
	vscode.action("workbench.action.closeActiveEditor")
end)

--
-- WINDOWS/PANES
--
vim.keymap.set("n", "<leader>-", function()
	vscode.action("workbench.action.splitEditorDown")
end)

vim.keymap.set("n", "<leader>\\", function()
	vscode.action("workbench.action.splitEditorRight")
end)

vim.keymap.set("n", "<leader>l", function()
	vscode.action("workbench.action.navigateRight")
end)
vim.keymap.set("n", "<leader>h", function()
	vscode.action("workbench.action.navigateLeft")
end)
vim.keymap.set("n", "<leader>k", function()
	vscode.action("workbench.action.navigateUp")
end)
vim.keymap.set("n", "<leader>j", function()
	vscode.action("workbench.action.navigateDown")
end)

--
-- SIDEBAR
--
vim.keymap.set("n", "<leader>nn", function()
	vscode.action("workbench.action.toggleSidebarVisibility")
end)
