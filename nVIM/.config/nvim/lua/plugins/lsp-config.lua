return {
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
          "hyprls",
          "bashls"
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- local lspconfig = require("lspconfig")
			vim.lsp.config["lua_ls"] = {
        capabilties = capabilities
      }
      vim.lsp.config["ts_ls"] = {
        capabilties = capabilities
      }

      vim.lsp.config["hyprls"] = {
        capabilities = capabilities
      }

      vim.lsp.config["bashls"] = {
        capabilities = capabilities
      }

			vim.lsp.enable("lua_ls")
			vim.lsp.enable("ts_ls")
      vim.lsp.enable("hyprls")
      vim.lsp.enable("bash-language-server")

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

			vim.diagnostic.config({
				virtual_text = true,
			})
		end,
	},
}
