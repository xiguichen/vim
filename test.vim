autocmd filetype python map <leader>tf :TestFile<CR> 
autocmd filetype python map <leader>ts :TestNearest<CR>

let test#custom_runners = {'CSharp': ['Nunit']}
