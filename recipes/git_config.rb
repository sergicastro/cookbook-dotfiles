bash 'copy git config' do
  code <<-EOF
    set -e
    ln -sf $dotfiles_path/git/.gitconfig $HOME/.gitconfig
    ln -sf $dotfiles_path/git/templatedir/ $HOME/.gittemplate
  EOF
end
