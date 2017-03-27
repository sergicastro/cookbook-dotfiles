env_dotfiles = node['environment']['dotfiles']
env_user = node['environment']['user']

git 'clone dotfiles' do
  repository 'https://github.com/sergicastro/dotfiles'
  revision 'cookbook'
  destination env_dotfiles
  user env_user
  group env_user
  enable_submodules true
  action :checkout
end

# bash 'use https' do
#   code <<-EOF
#     set -e
#     cd #{env_dotfiles}
#     sed -i 's_git@github.com:_https://github.com/_' .gitmodules
#     cd /
#   EOF
# end

# git 'init dotfiles' do
#   repository 'https://github.com/sergicastro/dotfiles'
#   revision 'master'
#   destination env_dotfiles
#   enable_submodules true
#   user env_user
#   group env_user
#   action :sync
# end
