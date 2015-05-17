require 'spec_helper'

describe 'cafe-core::default' do
  describe command('ls -al /') do
    its(:stdout) { should match(/bin/) }
  end
end
