local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
    return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
    sources = {
        formatting.prettier.with({
            extra_args = function(params)
                return params.options
                and params.options.tabSize
                and {
                    "--tab-width",
                    params.options.tabSize,
                }
            end,
        }),
        formatting.black.with({ extra_args = { '--fast' } }),
        formatting.stylua,
        formatting.clang_format,
        formatting.cmake_format,
        null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.chktex,
        null_ls.builtins.diagnostics.cppcheck,
        null_ls.builtins.completion.spell,
        null_ls.builtins.completion.luasnip,
    },
    on_attach = function(client)
        if client.resolved_capabilities.document_formattting then
            vim.cmd([[
            augroup LspFormatting
                autocmd! *<buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
        end
    end,
})
