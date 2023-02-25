vim.cmd [[
  if has('nvim')
    let $GIT_EDITOR = 'nvr -cc split --remote-wait'
  endif
]]
vim.cmd [[
  autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete
]]
