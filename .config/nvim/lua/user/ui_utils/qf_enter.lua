-----------------------------------------------------------------------
-- NeoVim config module for opening items in quick fix in splits/tabs
-----------------------------------------------------------------------

return {
	"yssl/QFEnter",
	config = function()
		vim.cmd([[
            let g:qfenter_keymap = {}
            let g:qfenter_keymap.vopen = ['<C-v>']
            let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
            let g:qfenter_keymap.topen = ['<C-t>']
        ]])
	end,
}
