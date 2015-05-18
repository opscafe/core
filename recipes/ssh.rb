#
# Cookbook Name:: cafe-core
# Recipe:: ssh
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
Installs and enables the openssh server.
Sets practical and secure sshd defaults:

- Disables root login.
- Disables password login.
- Enables agent forwarding.
#>
=end

node.set['cafe']['core']['ssh']['active'] = true

node.default['openssh']['server']['password_authentication'] = 'no'
node.default['openssh']['server']['challenge_response_authentication'] = 'no'
node.default['openssh']['server']['permit_root_login'] = 'no'
node.default['openssh']['server']['t_c_p_keep_alive'] = 'yes'
node.default['openssh']['server']['allow_agent_forwarding'] = 'yes'

include_recipe 'openssh::default'
