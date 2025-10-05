return {
	cmd = { 'yag-template-lsp' },
	filetypes = { 'yagpdbcc' },
	on_attach = function(client, bufnr)
		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		vim.lsp.completion.enable(true, client.id, bufnr, {})
	end,
}
