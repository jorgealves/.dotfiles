local settings = {
	o = {
		number=true,
		relativenumber=true,
		scrolloff=12,
		autoread=true,
		background = 'dark',
		clipboard='unnamedplus',
		cmdheight=2,
		cursorline=true,
		emoji=true,
		hlsearch=true,
		icon=true,
		laststatus=3,
		lazydraw=true,
		linebreak=true,
		smartcase=true,
		smarttab=true,
		splitbelow=true,
		splitright=true,
		statusline=true,
		termguicolors=true,
		winbar=true,
		wrap=false,
	},
	b={
		autoindent=true,
		smartindent=true,
		binary = true,
		syntax=true,

	},
	w={

		cursorline=true,
		list=true,
		spell=true,

	}
}

for option, values in pairs(settings) do 
	for key,value in pairs(values) do 
		vim[option][key]=value
	end
end
