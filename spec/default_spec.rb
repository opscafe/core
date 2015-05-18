require 'spec_helper'

describe 'cafe-core::default' do
  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  before(:each) do
    stub_command('which sudo')
  end

  recipes = %w(common ssh sudo)

  it 'does not configure firewall' do
    expect(chef_run).to_not include_recipe('cafe-core::firewall')
  end

  context 'when corresponding attribute is not enabled' do
    recipes.each do |recipe|
      it "does not configure #{recipe}" do
        chef_run = ChefSpec::ServerRunner.new do |node|
          node.set['cafe']['core'][recipe]['enable'] = false
        end.converge(described_recipe)
        expect(chef_run).to_not include_recipe("cafe-core::#{recipe}")
      end
    end
  end

  context 'when corresponding attribute is enabled' do
    recipes.each do |recipe|
      it "configures #{recipe}" do
        chef_run = ChefSpec::ServerRunner.new do |node|
          node.set['cafe']['core'][recipe]['enable'] = true
        end.converge(described_recipe)

        expect(chef_run).to include_recipe("cafe-core::#{recipe}")
      end
    end
  end
end
