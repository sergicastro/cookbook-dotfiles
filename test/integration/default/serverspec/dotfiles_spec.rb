require 'serverspec'

describe 'dotfiles cloned' do
  it 'git is installed' do
    expect(package('git')).to be_installed
  end

  it 'dotfiles project cloned' do
    expect(file('/home/vagrant/.dotfiles')).to exist
  end
end

describe 'git configured' do
  it 'git config files links created' do
    expect(file('/home/vagrant/.gitconfig')).to \
      be_linked_to('/home/vagrant/.dotfiles/git/.gitconfig')
    expect(file('/home/vagrant/.gittemplate')).to \
      be_linked_to('/home/vagrant/.dotfiles/git/templatedir/')
  end
end

describe 'scripts folder configured' do
  it 'scripts link to folder exists' do
    expect(file('/home/vagrant/scripts')).to \
      be_linked_to('/home/vagrant/.dotfiles/scripts/')
  end
end

describe 'vim is installed' do
  it 'vim is installed' do
    expect(package('vim')).to be_installed
  end

  it 'vim is configured' do
    expect(file('/home/vagrant/.vim')).to \
      be_linked_to('/home/vagrant/.dotfiles/vim/.vim/')
    expect(file('/home/vagrant/.vimrc')).to \
      be_linked_to('/home/vagrant/.dotfiles/vim/.vimrc')
  end
end
