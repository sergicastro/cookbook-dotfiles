
ENV['dotfiles_path'] = ENV['HOME'] + '/.dotfiles'

git 'clone dotfiles' do
  repository 'https://github.com/sergicastro/dotfiles'
  revision 'master'
  destination ENV['dotfiles_path']
  action :checkout
end

bash 'use https' do
  code <<-EOF
    set -e
    cd $dotfiles_path
    sed -i 's_git@github.com:_https://github.com/_' .gitmodules
    cd /
  EOF
end

git 'init dotfiles' do
  repository 'https://github.com/sergicastro/dotfiles'
  revision 'master'
  destination ENV['dotfiles_path']
  enable_submodules true
  action :sync
end
