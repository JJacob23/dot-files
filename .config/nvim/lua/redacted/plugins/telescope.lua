return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
      "debugloop/telescope-undo.nvim",
    },
    config = function()
      require('telescope').setup {
	pickers = {
	  find_files = {
	    theme = "ivy"
	  }
	},
	extensions = {
	  fzf = {},
	  undo = {
	    side_by_side = true,
	    layout_strategy = "vertical",
	    layout_config = {
	      preview_height = 0.8,
	    }
	  }
 	}
      }

      require('telescope').load_extension('fzf')
      require('telescope').load_extension('undo')

      vim.keymap.set("n", "<space>pf", require('telescope.builtin').find_files)
      vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags)
      vim.keymap.set("n", "<space>ev", function()
	require('telescope.builtin').find_files {
	  cwd = vim.fn.stdpath("config")
	}
      end)
      vim.keymap.set("n", "<C-u>", "<cmd>Telescope undo<cr>")

      require "redacted.telescope.multigrep".setup()
    end
  }
}
