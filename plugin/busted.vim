let s:plugin_path = expand("<sfile>:p:h:h")

if !exists("g:busted_command")
  let s:cmd = "busted {spec}"

  if has("gui_running") && has("gui_macvim")
    let g:busted_command = "silent !" . s:plugin_path . "/bin/run_in_os_x_terminal '" . s:cmd . "'"
  else
    let g:busted_command = "!echo " . s:cmd . " && " . s:cmd
  endif
endif

function! RunAllSpecs()
  let l:spec = "spec"
  call SetLastSpecCommand(l:spec)
  call RunSpecs(l:spec)
endfunction

function! RunCurrentSpecFile()
  if InSpecFile()
    let l:spec = expand('%:p')
    call SetLastSpecCommand(l:spec)
    call RunSpecs(l:spec)
  else
    call RunLastSpec()
  endif
endfunction

function! RunNearestSpec()
  if InSpecFile()
    let l:spec =  expand('%:p') . ":" . line(".")
    call SetLastSpecCommand(l:spec)
    call RunSpecs(l:spec)
  else
    call RunLastSpec()
  endif
endfunction

function! RunLastSpec()
  if exists("s:last_spec_command")
    call RunSpecs(s:last_spec_command)
  endif
endfunction

function! InSpecFile()
  return match(expand("%"), "_spec.lua$") != -1 || match(expand("%"), "_spec.moon$") != -1
endfunction

function! SetLastSpecCommand(spec)
  let s:last_spec_command = a:spec
endfunction

function! RunSpecs(spec)
  write
  execute substitute(g:busted_command, "{spec}", a:spec, "g")
endfunction
