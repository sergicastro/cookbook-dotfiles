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
    expect(file('/home/vagrant/.gitconfig')).to exist
    expect(file('/home/vagrant/.gittemplate')).to exist
  end
end