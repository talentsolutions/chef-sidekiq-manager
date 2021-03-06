# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'sidekiq-manager::default' do
  subject { ChefSpec::Runner.new.converge(described_recipe) }

  # Write full examples using the `expect` syntax
  it 'does includes recipes' do
    expect(subject).to include_recipe('redisio')
    expect(subject).to include_recipe('redisio::enable')
  end
end
