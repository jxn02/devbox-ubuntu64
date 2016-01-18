name                'devbox'
maintainer          'Julien Lorthios'
maintainer_email    'julien.lorthios@gmail.com'
description         'Une super box vagrant de la mort qui tue'
version             '1.0.0'

recipe 'devbox', 'devbox custom'

depends 'apt'
depends 'system'
depends 'nginx'
depends 'xdebug'
depends 'phpmd'
depends 'phpcs'
depends 'php'
depends 'redisio'
depends 'mailhog'
depends 'mongodb3'
depends 'apache2'
depends 'percona'

%W{ debian ubuntu }.each do |os|
    supports os
end