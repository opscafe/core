#
# Cookbook Name:: cafe-core
# Recipe:: default
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
Includes each other `recipe` in this cookbook according to
the corresponding attribute:

```
node['cafe']['core'][recipe]['enable']
```
#>
=end

%w(common ssh sudo).each do |recipe|
  next unless node['cafe']['core'][recipe]['enable']
  include_recipe "cafe-core::#{recipe}"
end
