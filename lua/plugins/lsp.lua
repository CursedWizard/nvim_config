return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      "p00f/clangd_extensions.nvim",
    },
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = true,
        virtual_text = false,
        severity_sort = true,
      },
      autoformat = false,
    },
    init = function()
      require("legendary").keymaps({
        {
          "<leader>cm",
          ":Mason",
          description = "Open Mason",
          mode = { "n" },
        },
      })

      vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
          local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            source = "always",
            prefix = " ",
            scope = "cursor",
          }
          vim.diagnostic.open_float(nil, opts)
        end,
      })

      local client_capabilities = vim.lsp.protocol.make_client_capabilities()
      client_capabilities = require("cmp_nvim_lsp").default_capabilities(client_capabilities)
      client_capabilities.offsetEncoding = { "utf-16" }

      require("clangd_extensions").setup({
        server = {
          -- on_attach = prefer_null_ls_fmt,
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--completion-style=bundled",
            "--header-insertion=iwyu",
            "--cross-file-rename",
          },
          init_options = {
            clangdFileStatus = true,
            usePlaceholders = true,
            completeUnimported = true,
            semanticHighlighting = true,
          },
          capabilities = client_capabilities,
        },
        extensions = { inlay_hints = { only_current_line = false, show_variable_name = true } },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "help",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "vue",
      },
    },
  },
}
