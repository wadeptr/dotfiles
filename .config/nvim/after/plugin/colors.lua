function Colors(color)
	color = color or "gruvbox-material"
	vim.cmd.colorscheme(color)

	-- gruvbox doesn't support transparent background
	
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

Colors()
