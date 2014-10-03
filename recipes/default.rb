# -*- coding: utf-8 -*-
#
# Cookbook Name:: sidekiq-manager
# Recipe:: default
#
# Copyright 2014, We're in s.r.o.
#

include_recipe 'redisio'
include_recipe 'redisio::enable'

template '/etc/init/sidekiq.conf' do
  mode 0644
  source 'config.erb'
  variables application_root: node['rails']['applications_root'],
            deploy_user: 'deploy'
end

apps = node['sidekiq'] && node['sidekiq']['apps'] ? node['sidekiq']['apps'] : {}
template '/etc/sidekiq.conf' do
  mode 0644
  source 'enabled.erb'
  variables apps: apps,
            application_root: node['rails']['applications_root']
end

template '/etc/init/sidekiq-manager.conf' do
  mode 0644
  source 'manager.erb'
end

# # TODO: If is not running
# execute 'start sidekiq manager' do
#   command 'sudo start sidekiq-manager'
# end
