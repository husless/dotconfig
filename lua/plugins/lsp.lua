return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      -- @type lspconfig.options
      -- options for vim.diagnostic.config()
      -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the inlay hints.
      inlay_hints = {
        enabled = false,
      },
      servers = {
        jsonls = { mason = false },
        clangd = {
          mason = false,
          root_dir = function(fname)
            local root_files = {
              ".clangd",
              ".clang-tidy",
              ".clang-format",
              "compile_commands.json",
              "compile_flags.txt",
              "configure.ac",
              ".git",
            }
            return require("lspconfig").util.root_pattern(unpack(root_files))(fname)
          end,
          capabilities = {
            offsetEncoding = { "utf-16" },
          },
        },
        cmake = {},
        rust_analyzer = {
          mason = false,
          settings = {
            ["rust-analyzer"] = {
              Cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                runBuildScripts = true,
              },
              -- Add clippy lints for Rust.
              checkOnSave = true,
              ProcMacro = {
                enable = true,
                ignored = {
                  ["async-trait"] = { "async_trait" },
                  ["napi-derive"] = { "napi" },
                  ["async-recursion"] = { "async_recursion" },
                },
              },
            },
          },
          cmd = { "rustup", "run", "stable", "rust-analyzer" },
        },
        lua_ls = {
          -- mason = false, -- set to false if you don't want this server to be installed with mason
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
        jedi_language_server = {},
        ruff_lsp = {
          init_options = {
            settings = {
              -- Any extra CLI arguments for `ruff` go here.
              args = {
                "--select=ALL",
                "--ignore=ANN101,D1,D211,D213,EXE,I,PTH,Q000,T20",
                "--unfixable=F401",
                "--line-length=120",
              },
            },
          },
        },
        zls = {},
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      ensure_installed = {
        "stylua",
        "ruff",
        "ruff-lsp",
        "black",
        "mypy",
        "zls",
        "cmake-language-server",
      },
    },
  },
}
