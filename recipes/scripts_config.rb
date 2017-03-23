env_home = node['environment']['home']
env_dotfiles = node['environment']['dotfiles']

link 'HOME/scripts/' do
  target_file env_home + '/scripts'
  to env_dotfiles + '/scripts/'
  link_type :symbolic
end
