return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
    },
    opts = {
      diagnostics = {
        -- global lsp settings
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "always",
          prefix = "●",
        },
        severity_sort = true,
        float = {
          border = "rounded",
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "✘",
            [vim.diagnostic.severity.WARN] = "▲",
            [vim.diagnostic.severity.HINT] = "⚑",
            [vim.diagnostic.severity.INFO] = "»",
          },
        },
      },
      servers = {
        gopls = {},
        jdtls = {},
        lua_ls = {},
        ts_ls = {},
        jsonls = {},
        clangd = {},
        tinymist = {},
        cssls = {},
        gleam = {},
        hls = {},
        pylsp = {},
        ruff = {},
        ty = {},
      },
    },
    config = function(_, opts)
      vim.diagnostic.config({ float = { border = "rounded" } })
      local lspconfig = require("lspconfig")
      local configs = require("lspconfig.configs")

      -- Setup global diagnostics
      vim.diagnostic.config(vim.tbl_deep_extend("force", {
        float = {
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      }, opts.diagnostics))

      -- Register custom LSP servers
      local custom_servers = {
        ty = {
          name = "ty",
          cmd = { "ty", "server" },
          filetypes = { "python" },
          root_dir = lspconfig.util.root_pattern("ty.toml", "pyproject.toml", ".git"),
          single_file_support = true,
        },
      }

      -- custom servers
      for server_name, server_config in pairs(custom_servers) do
        if not configs[server_name] then
          configs[server_name] = { default_config = server_config }
        end
      end

      -- builtin servers
      local default_capabilities = require("blink.cmp").get_lsp_capabilities()
      for server, config in pairs(opts.servers) do
        -- Merge with default capabilities
        config.capabilities = vim.tbl_deep_extend("force", {}, default_capabilities, config.capabilities or {})

        -- Add common settings
        config.flags = config.flags or {}
        config.flags.debounce_text_changes = 150

        lspconfig[server].setup(config)
        -- config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        -- lspconfig[server].setup(config)
      end

      -- Keybindings for lsp tasks
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc, silent = true })
          end

          local telescope = require("telescope.builtin")

          --  To jump back, press <C-t>.

          -- navigation
          map("gd", telescope.lsp_definitions, "[G]oto [D]efinition")
          map("gr", telescope.lsp_references, "[G]oto [R]eferences")
          map("gI", telescope.lsp_implementations, "[G]oto [I]mplementation")
          map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
          map("<leader>D", telescope.lsp_type_definitions, "Type [D]efinition")

          -- docs
          map("K", vim.lsp.buf.hover, "Hover Documentation")
          map("<C-k>", vim.lsp.buf.signature_help, "Signature Help", { "n", "i" })

          -- code actions
          map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
          map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

          -- workspace
          map("<leader>ws", telescope.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
          map("<leader>ds", telescope.lsp_document_symbols, "[D]ocument [S]ymbols")

          -- diagnostics
          map("<leader>e", vim.diagnostic.open_float, "Show Line Diagnostics")
          -- map("<leader>lk", vim.diagnostic.open_float, "Open floating diagnostic message")
          -- Jump to next diagnostic and open float message
          map("[d", function()
            vim.diagnostic.goto_prev({ float = true })
          end, "Next Diagnostic Message")

          -- Jump to previous diagnostic and open float message
          map("]d", function()
            vim.diagnostic.goto_next({ float = true })
          end, "Previous Diagnostic Message")

          -- Inlay hints (if supported)
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method("textDocument/inlayHint") then
            map("<leader>th", function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, "Toggle Inlay Hints")
          end
        end,
      })
    end,
  },
}
