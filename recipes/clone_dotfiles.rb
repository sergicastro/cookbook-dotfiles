env_dotfiles = node['environment']['dotfiles']

git 'clone dotfiles' do
  repository 'https://github.com/sergicastro/dotfiles'
  revision 'master'
  destination env_dotfiles
  action :checkout
end

bash 'use https' do
  code <<-EOF
    set -e
    cd #{env_dotfiles}
    sed -i 's_git@github.com:_https://github.com/_' .gitmodules
    cd /
  EOF
end

git 'init dotfiles' do
  repository 'https://github.com/sergicastro/dotfiles'
  revision 'master'
  destination env_dotfiles
  enable_submodules true
  action :sync
end
