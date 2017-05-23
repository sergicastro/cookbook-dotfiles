env_home = node['environment']['home']
env_user = node['environment']['user']

git 'clone rbenv' do
  repository 'https://github.com/rbenv/rbenv'
  revision 'master'
  destination env_home + '/.rbenv'
  user env_user
  group env_user
  enable_submodules true
  action :checkout
end

directory env_home + '/.rbenv/plugins' do
  owner env_user
  group env_user
  action :create
end

git 'clone ruby build' do
  repository 'https://github.com/rbenv/ruby-build'
  revision 'master'
  destination env_home + '/.rbenv/plugins/ruby-build'
  user env_user
  group env_user
  enable_submodules true
  action :checkout
end
