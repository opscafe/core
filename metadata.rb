name             'cafe-core'
maintainer       'Evan Sosenko'
maintainer_email 'razorx@evansosenko.com'
license          'Apache 2.0'
description      'OpsCafe common core infrastructure.'
source_url       'https://github.com/opscafe/core'
issues_url       'https://github.com/opscafe/core/issues'
version          '0.0.2'

supports 'ubuntu', '~> 14.04'

depends 'apt', '~> 2.8.2'
depends 'ntp', '~> 1.8.6'
depends 'openssh', '~> 1.5.0'
depends 'sudo', '~> 2.7.1'
depends 'users', '~> 1.8.2'
depends 'zsh', '~> 1.0.1'
depends 'vim', '~> 1.1.2'

recipe 'cafe-core::default', 'Installs and configures core services.'
recipe 'cafe-core::common', 'Configures smart defaults.'
recipe 'cafe-core::ssh', 'Configures an ssh server.'
recipe 'cafe-core::sudo', 'Configures and enables sudo.'

attribute 'cafe/core/common/enable',
          display_name: 'Enable common recipe',
          description: 'Include the common recipe by default.',
          type: 'boolean',
          recipes: ['cafe-core::default'],
          default: true

attribute 'cafe/core/ssh/enable',
          display_name: 'Enable ssh recipe',
          description: 'Include the ssh recipe by default.',
          type: 'boolean',
          recipes: ['cafe-core::default'],
          default: true

attribute 'cafe/core/sudo/enable',
          display_name: 'Enable sudo recipe',
          description: 'Include the sudo recipe by default.',
          type: 'boolean',
          recipes: ['cafe-core::default'],
          default: true
