# I switched to neovim, but for convenience i just use vim
# command anyways.

set NVIM (which nvim ^ /dev/null)

if test -x $NVIM

  alias vim=$NVIM
  set EDITOR $NVIM

  if not test -d ~/.config
    mkdir ~/.config
  end

  if not test -L ~/.config/nvim
    ln -s ~/.vim ~/.config/nvim
  end

  if not test -L ~/.config/nvim/init.vim
    ln -s ~/.vimrc ~/.config/nvim/init.vim
  end

end
