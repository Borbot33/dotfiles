return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		lazy = false,
		opts = {
			-- fill any relevant options here
		},
		config = function()
			vim.api.nvim_create_autocmd('BufEnter', {
				callback = function()
					if vim.bo.buftype == '' then vim.cmd('Neotree close') end
				end,
			})
		end
	}
}

