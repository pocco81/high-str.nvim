


" GPL-3.0 License

" prevent the plugin from loading twice
if exists('g:loaded_DuckumentManners') | finish | endif

let s:save_cpo = &cpo " save user coptions
set cpo&vim " reset them to defaults

" Utils {{{
function! dmcmds#get_first_arg(...)
	return "".a:1.""
endfunction
" }}}

" Test Availability {{{
function! dmcmds#available_args_tool_highlight() abort
	return luaeval('require("duckument-manners.utils.available_args.args_tool_highlight").available_commands()')
endfunction
" }}}

" Tab Completion {{{
function! s:complete_args_tool_highlight(arg, line, pos) abort
	return join(dmcmds#available_args_tool_highlight(), "\n")
endfunction
" }}}


" Interface {{{
command! -nargs=* -complete=custom,s:complete_args_tool_highlight DMHighlight call v:lua.require("duckument-manners.main").main(0,dmcmds#get_first_arg(<f-args>))
" }}}


let &cpo = s:save_cpo " and restore after
unlet s:save_cpo

" set to true the var that controls the plugin's loading
let g:loaded_DuckumentManners = 1
