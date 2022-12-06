local ok, telescope = pcall(require, 'telescope')
if not ok then
  error('telescope not loaded')
end
local ok, command_center = pcall(require, 'command_center')
if not ok then
  error('command_center not loaded')
end

telescope.setup{
  extensions = {
    fzf = {
      fuzzy = true,
      case_mode = 'smart_case',
      override_file_sorter = true,
      override_generic_sorter = true,
    },
    project =  {
      base_dirs={
        {path = '~/projects', max_depth=5}
      },
      hidden_files=true,
      theme= 'dropdown',
      order_by= 'asc',
      sync_with_nvim_tree = true,
    },
    fzf_writer = {
      minimum_grep_characters = 2,
      minimum_files_characters = 2,
      use_highlighter = true,
    },
    file_browser = {
      hijack_netrw=true,
      theme='ivy'
    },
  },
  mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
}

telescope.load_extension('fzf')
telescope.load_extension('project')
telescope.load_extension('media_files')
telescope.load_extension('lsp_handlers')
telescope.load_extension('file_browser')

