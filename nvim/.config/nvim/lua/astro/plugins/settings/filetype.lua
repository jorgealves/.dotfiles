local ok, filetype = pcall(require, "filetype")

if not ok then
	error("error loading filetype plugin")
	return
end

vim.g.did_load_filetypes = 1

filetype.setup {
  overrides = {
    extensions = {
      tf = "terraform",
      tfvars = "terraform",
      tfstate = "json"
    }
  }
}
