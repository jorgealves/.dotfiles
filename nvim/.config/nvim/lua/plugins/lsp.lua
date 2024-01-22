return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
  {
    "b0o/schemastore.nvim",
  },
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.tsserver.setup({
				capabilites = capabilities,
			})
			lspconfig.html.setup({
				capabilites = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilites = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
      lspconfig.jsonls.setup({
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = {enable = true},
          },
        },
      })

      lspconfig.yamlls.setup({
        settings = {
          yaml = {
            schemas = require('schemastore').yaml.schemas(),
            schemaStore = {
              enable = false,
              url = ""
            },
          },
        },
      })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "ca", vim.lsp.buf.code_action, {})
		end,
	},
}
