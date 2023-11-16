return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
  -- the opts function can also be used to change the default opts:
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   event = "VeryLazy",
  --   opts = function(_, opts)
  --     table.insert(opts.sections.lualine_x, "😄")
  --   end,
  -- },

  -- or you can return new options to override all the defaults
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   event = "VeryLazy",
  --   opts = function()
  --     return {
  --       --[[add your custom lualine config here]]
  --     }
  --   end,
  -- },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
███╗   ███╗██╗███████╗███████╗██╗███╗   ██╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗ ████║██║██╔════╝██╔════╝██║████╗  ██║██╔════╝ ██║   ██║██║████╗ ████║
██╔████╔██║██║███████╗███████╗██║██╔██╗ ██║██║  ███╗██║   ██║██║██╔████╔██║
██║╚██╔╝██║██║╚════██║╚════██║██║██║╚██╗██║██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚═╝ ██║██║███████║███████║██║██║ ╚████║╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝     ╚═╝╚═╝╚══════╝╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
