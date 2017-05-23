env_home = node['environment']['home']
env_user = node['environment']['user']

git 'clone jenv' do
  repository 'https://github.com/gcuisinier/jenv'
  revision 'master'
  destination env_home + '/.jenv'
  user env_user
  group env_user
  enable_submodules true
  action :checkout
end
