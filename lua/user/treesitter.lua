
local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup {
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = {
        "cpp",
        "rust",
        "python",
    },

    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- List of parsers to ignore installing
    ignore_install = { "javascript", "java", "php" },
    autopairs = { enable = true, },

    highlight = {
        -- `false` will disable the whole extension
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
}
