#
# Cookbook Name:: cafe-core
# Recipe:: common
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
Includes a set of practical cookbooks to setup the following:

- logrotate
- Network Time Protocol (NTP)
- Zsh
- Vim

Also includes the `apt::default` recipe on Debian based platforms.
#>
=end

include_recipe 'apt::default' if platform_family? 'debian'
include_recipe 'logrotate::default'
include_recipe 'ntp::default'
include_recipe 'zsh::default'
include_recipe 'vim::default'
