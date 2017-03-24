env_home = node['environment']['home']
env_dotfiles = node['environment']['dotfiles']

link 'HOME/vim' do
  target_file env_home + '/.vim'
  to env_dotfiles + '/vim/.vim'
  link_type :symbolic
end

link 'HOME/.vimrc' do
  target_file env_home + '/.vimrc'
  to env_dotfiles + '/vim/.vimrc'
  link_type :symbolic
end
