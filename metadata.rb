name             'cafe-core'
maintainer       'Evan Sosenko'
maintainer_email 'razorx@evansosenko.com'
license          'Apache 2.0'
description      'OpsCafe common core infrastructure.'
source_url       'https://github.com/opscafe/core'
issues_url       'https://github.com/opscafe/core/issues'
version          '0.0.0'

supports 'ubuntu', '~> 14.04'

recipe 'cafe-core::default', 'Installs and configures core services.'
