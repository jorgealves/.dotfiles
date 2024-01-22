return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.code_actions.eslint,
				null_ls.builtins.code_actions.gitsigns,
				null_ls.builtins.code_actions.refactoring,

				null_ls.builtins.completion.luasnip,

				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.diagnostics.checkmake,
				null_ls.builtins.diagnostics.curlylint,
				null_ls.builtins.diagnostics.djlint,
				null_ls.builtins.diagnostics.editorconfig_checker,
				null_ls.builtins.diagnostics.flake8,
				null_ls.builtins.diagnostics.hadolinnt,
				null_ls.builtins.diagnostics.jsonlint,
				null_ls.builtins.diagnostics.luacheck,
				null_ls.builtins.diagnostics.markdownlint_cli2,
				null_ls.builtins.diagnostics.opacheck,
				null_ls.builtins.diagnostics.pmd,
				null_ls.builtins.diagnostics.pycodestyle,
				null_ls.builtins.diagnostics.pydocstyle,
				null_ls.builtins.diagnostics.pylint,
				null_ls.builtins.diagnostics.pyproject_flake8,
				null_ls.builtins.diagnostics.ruff,
				null_ls.builtins.diagnostics.trivy,
				null_ls.builtins.diagnostics.typos,
				null_ls.builtins.diagnostics.vacuum,
				null_ls.builtins.diagnostics.yamllint,

				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.pyright,
				null_ls.builtins.formatting.autopep8,
				null_ls.builtins.formatting.autoflake,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.djhtml,
				null_ls.builtins.formatting.djlint,
				null_ls.builtins.formatting.dprint,
				null_ls.builtins.formatting.eslint,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
