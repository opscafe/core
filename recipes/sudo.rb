#
# Cookbook Name:: cafe-core
# Recipe:: sudo
#
# Copyright 2015 Evan Sosenko
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
=begin
#<
Enables sudo configuration through `sudoers.d`.

Creates and configures the `sysadmin` group for passwordless sudo.
The `sysadmin` group is created only if the `uses` data bag exists
and contains at least one sysadmin user.
For example, see
[sudoroot.json](./test/integration/sudo/data_bags/users/sudoroot.json).
#>
=end

node.set['cafe']['core']['sudo']['active'] = true

node.default['authorization']['sudo']['users'] = []
node.default['authorization']['sudo']['groups'] = ['sysadmin']
node.default['authorization']['sudo']['passwordless'] = true
node.default['authorization']['sudo']['include_sudoers_d'] = true

include_recipe 'sudo::default'

begin
  message = "The 'users' data bag does not exist: " \
            'the sysadmin group will not be created.'
  data_bag 'users'
rescue Chef::Exceptions::InvalidDataBagPath
  Chef::Log.warn message
rescue Net::HTTPServerException => e
  raise e unless e.response.code == '404'
  Chef::Log.warn message
else
  include_recipe 'users::sysadmins'
end
