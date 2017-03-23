env_home = node['environment']['home']
env_dotfiles = node['environment']['dotfiles']

link 'HOME/.gitconfig' do
  target_file env_home + '/.gitconfig'
  to env_dotfiles + '/git/.gitconfig'
  link_type :symbolic
end

link 'HOME/.gittemplate' do
  target_file env_home + '/.gittemplate'
  to env_dotfiles + '/git/templatedir/'
  link_type :symbolic
end
