#
# Cookbook Name:: dotfiles
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

include_recipe 'git::default'
include_recipe 'dotfiles::clone_dotfiles'
include_recipe 'dotfiles::git_config'
include_recipe 'dotfiles::scripts_config'
include_recipe 'vim::default'
include_recipe 'dotfiles::vim_config'
include_recipe 'dotfiles::zsh'
