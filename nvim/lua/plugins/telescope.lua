-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = "close",
        ["<Esc>"] = "close",
        ["<C-t>"] = "move_to_top",
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      },
    },
  },
  pickers = {
    find_files = {
      theme = "ivy",
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require("telescope").load_extension("neoclip")
require('neoclip').setup({
  history = 1000,
  preview = false,
  default_register = '"',
  default_register_macros = 'q',
  on_paste = {
    set_reg = true,
  },
  on = {
    set_reg = true,
  },
  keys = {
        telescope = {
          i = {
            paste = '<Enter>',
            paste_behind = '<c-p>',
          },
          n = {
            paste = '<Enter>',
            paste_behind = 'P',
          },
        },
      },
})
