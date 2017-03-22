dotfiles_path = ENV['dotfiles_path']
home = ENV['HOME']

link home + '/.gitconfig' do
  to dotfiles_path + '/git/.gitconfig'
  link_type :symbolic
end

link home + '/.gittemplate' do
  to dotfiles_path + '/git/templatedir/'
  link_type :symbolic
end
