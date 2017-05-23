env_home = node['environment']['home']
env_user = node['environment']['user']
env_dotfiles = node['environment']['dotfiles']

package 'zsh' do
  action :install
end

link 'HOME/.zshrc/' do
  target_file env_home + '/.zshrc'
  to env_dotfiles + '/zsh/.zshrc'
  link_type :symbolic
end

git 'clone oh-my-zsh' do
  repository 'https://github.com/robbyrussell/oh-my-zsh'
  revision 'master'
  destination env_home + '/.oh-my-zsh'
  user env_user
  group env_user
  enable_submodules true
  action :checkout
end

link 'scastro oh-my-zsh theme' do
  target_file env_home + '/.oh-my-zsh/themes/scastro.zsh-theme'
  to env_dotfiles + '/zsh/themes/scastro.zsh-theme'
  link_type :symbolic
end

bash 'change shell to zsh' do
  code 'chsh -s /bin/zsh'
  action :run
end
