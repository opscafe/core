require 'spec_helper'

describe 'cafe-core::common' do
  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'marks the common recipe as active' do
    expect(chef_run.node['cafe']['core']['common']['active']).to be true
  end

  cookbooks = %w(logrotate ntp zsh vim)

  cookbooks.each do |cookbook|
    it "includes the #{cookbook}::default recipe" do
      expect(chef_run).to include_recipe("#{cookbook}::default")
    end
  end

  context 'when platform is ubuntu' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(
        platform: 'ubuntu', version: '14.04'
      ).converge(described_recipe)
    end

    it 'includes the apt::default recipe' do
      expect(chef_run).to include_recipe('apt::default')
    end
  end
end
