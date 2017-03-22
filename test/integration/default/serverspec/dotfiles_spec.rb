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
