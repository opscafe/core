# cafe-core

[![Cookbook Version](https://img.shields.io/cookbook/v/cafe-core.svg)](https://supermarket.chef.io/cookbooks/cafe-core)
[![Apache 2.0 License](https://img.shields.io/github/license/opscafe/core.svg)](./LICENSE.txt)
[![Dependency Status](https://img.shields.io/gemnasium/opscafe/core.svg)](https://gemnasium.com/opscafe/core)
[![Build Status](https://img.shields.io/travis/opscafe/core.svg)](https://travis-ci.org/opscafe/core)
[![Coverage Status](https://img.shields.io/codecov/c/github/opscafe/core.svg)](https://codecov.io/github/opscafe/core)

## Description

OpsCafe common core infrastructure.

### Usage

This Chef cookbook is a volume in the
OpsCafe infrastructure cookbook series.
It can function independently
or integrate seamlessly with other `cafe-*` cookbooks.


## Requirements

### Platforms

* Ubuntu (~> 14.04)

### Cookbooks:

* apt (~> 2.7.0)
* logrotate (~> 1.9.1)
* ntp (~> 1.8.6)
* openssh (~> 1.4.0)
* zsh (~> 1.0.1)
* vim (~> 1.1.2)

## Attributes

Attribute | Description | Default | Choices
----------|-------------|---------|--------
`node['cafe']['core']['common']['enable']` | `Include the common recipe by default.` | true |
`node['cafe']['core']['ssh']['enable']` | `Include the ssh recipe by default.` | true |
`node['cafe']['core']['sudo']['enable']` | `Include the sudo recipe by default.` | true |

## Recipes

* [cafe-core::default](#cafe-coredefault) - Installs and configures core services.
* [cafe-core::common](#cafe-corecommon) - Configures smart defaults.
* [cafe-core::ssh](#cafe-coressh) - Configures an ssh server.
* cafe-core::sudo - Configures and enables sudo.

### cafe-core::default

Includes each other `recipe` in this cookbook according to
the corresponding attribute:

```
node['cafe']['core'][recipe]['enable']
```


### cafe-core::common

Includes a set of practical cookbooks to setup the following:

- logrotate
- Network Time Protocol (NTP)
- Zsh
- Vim

Also includes the `apt::default` recipe on Debian based platforms.


### cafe-core::ssh

Installs and enables the openssh server.
Sets practical and secure sshd defaults:

- Disables root login
- Disables password login.
- Enables agent forwarding.


## Development and Testing

### Source Code

The [cafe-core source](https://github.com/opscafe/core)
is hosted on GitHub.
To clone the project run

```bash
$ git clone https://github.com/opscafe/core.git
```

### Rake

Run `rake -T` to see all Rake tasks.

```
rake all                          # Run all tasks
rake doc                          # Build documentation
rake foodcritic                   # Lint Chef cookbooks
rake kitchen:all                  # Run all test instances
rake kitchen:default-ubuntu-1404  # Run default-ubuntu-1404 test instance
rake readme                       # Generate README.md from _README.md.erb
rake rubocop                      # Run RuboCop
rake rubocop:auto_correct         # Auto-correct RuboCop offenses
rake spec                         # Run RSpec code examples
rake test                         # Run kitchen integration tests
rake yard                         # Generate YARD Documentation
```

### Thor

Run `thor -T` to see all Thor tasks.

### Guard

Guard tasks have been separated into the following groups:

- `doc`
- `lint`
- `unit`
- `integration`

By default, Guard will generate documentation, lint, and run unit tests.
The integration group must be selected manually with `guard -g integration`.

## Contributing

Please submit and comment on bug reports and feature requests.

To submit a patch:

1. Fork it (https://github.com/opscafe/core/fork).
2. Create your feature branch (`git checkout -b my-new-feature`).
3. Make changes. Write and run tests.
4. Commit your changes (`git commit -am 'Add some feature'`).
5. Push to the branch (`git push origin my-new-feature`).
6. Create a new Pull Request.

## License

Copyright 2015 Evan Sosenko

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

## Warranty

This software is provided "as is" and without any express or
implied warranties, including, without limitation, the implied
warranties of merchantibility and fitness for a particular
purpose.
