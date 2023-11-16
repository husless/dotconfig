return {
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "cpp",
        "go",
        "rust",
        "python",
        "dockerfile",
        "latex",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "regex",
        "vim",
        "yaml",
      },
      ignore_install = {
        "javascript",
        "html",
        "typescript",
        "tsx",
      },
      indent = {
        enable = true,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    },
  },
}
