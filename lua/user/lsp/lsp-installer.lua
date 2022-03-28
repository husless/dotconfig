local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then
    return
end

-- Register a hander that will be called for installed servers.
lsp_installer.on_server_ready(function(server)
    local handlers = require('user.lsp.handlers')
    local opts = {
        on_attach = handlers.on_attach,
        capabilities = handlers.capabilities,
    }

    if server.name == 'sumneko_lua' then
        local sumneko_opts = {
            settings = {
                Lua = {
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { 'vim' },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                            [vim.fn.stdpath('config') .. '/lua'] = true,
                        },
                    },
                    -- Do not send telemetry data containing a randomized but unique identifier
                    telemetry = {
                        enable = false,
                    },
                },
            },
        }
        opts = vim.tbl_deep_extend('force', sumneko_opts, opts)
    end
    if server.name == 'clangd' then
        opts.capabilities.offsetEncoding = { 'utf-16' }
    end

    -- this setup() function is exactly the same as lspconfig's.
    server:setup(opts)
end)
