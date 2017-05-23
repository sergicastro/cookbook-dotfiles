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
      be_linked_to('/home/vagrant/.dotfiles/vim/.vim')
    expect(file('/home/vagrant/.vimrc')).to \
      be_linked_to('/home/vagrant/.dotfiles/vim/.vimrc')
  end

  it 'ctags is intalled' do
    expect(package('exuberant-ctags')).to be_installed
  end
end

describe 'zsh is installed' do
  it 'zsh is installed' do
    expect(package('zsh')).to be_installed
  end

  it 'zsh dotfile linked' do
    expect(file('/home/vagrant/.zshrc')).to \
      be_linked_to('/home/vagrant/.dotfiles/zsh/.zshrc')
  end

  it 'oh-my-zsh cloned' do
    expect(file('/home/vagrant/.oh-my-zsh')).to exist
  end

  it 'scastro theme linked' do
    expect(file('/home/vagrant/.oh-my-zsh/themes/scastro.zsh-theme')).to \
      be_linked_to('/home/vagrant/.dotfiles/zsh/themes/scastro.zsh-theme')
  end

  it 'use zsh as default shell' do
    expect(command('getent passwd $LOGNAME | cut -d: -f7').stdout).to \
      eq("/bin/zsh\n")
  end
end
