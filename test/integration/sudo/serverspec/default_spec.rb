require 'spec_helper'

describe 'cafe-core::sudo' do
  describe command('sudo -u sudoroot sudo ls /root') do
    its(:exit_status) { should eq 0 }
  end
end
