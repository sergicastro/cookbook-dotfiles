env_home = node['environment']['home']
env_user = node['environment']['user']

git 'clone jenv' do
  repository 'https://github.com/rbenv/rbenv'
  revision 'master'
  destination env_home + '/.rbenv'
  user env_user
  group env_user
  enable_submodules true
  action :checkout
end
