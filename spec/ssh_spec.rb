require 'spec_helper'

describe 'cafe-core::ssh' do
  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'marks the ssh server as active' do
    expect(chef_run.node['cafe']['core']['ssh']['active']).to be true
  end

  it 'includes the openssh::default recipe' do
    expect(chef_run).to include_recipe('openssh::default')
  end
end
