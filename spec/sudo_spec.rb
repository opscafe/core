require 'spec_helper'

describe 'cafe-core::sudo' do
  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  before(:each) do
    stub_command('which sudo')
  end

  it 'marks the sudo recipe as active' do
    expect(chef_run.node['cafe']['core']['sudo']['active']).to be true
  end

  it 'includes the sudo::default recipe' do
    expect(chef_run).to include_recipe('sudo::default')
  end

  it 'includes the users::sysadmins recipe' do
    expect(chef_run).to include_recipe('users::sysadmins')
  end
end
