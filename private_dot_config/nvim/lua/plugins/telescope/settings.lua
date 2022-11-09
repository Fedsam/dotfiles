local telescope = require('telescope')

telescope.setup {
  defaults = {
    layout_strategy = 'vertical',
		file_ignore_patterns = {
			'.cache', '*.git', '.DS_Store', 'node_modules', 'dist', 'target'
		},
    path_display = {"truncate"}
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or --ignore_case-- or --respect_case--
                                       -- the default case_mode is --smart_case--
    }
  }
}
telescope.load_extension('fzf')
