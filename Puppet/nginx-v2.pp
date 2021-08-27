
package { 'nginx':
  ensure => 'present',
}

service { 'nginx':
  ensure => 'running',
  enable => 'true',
}

file { '/usr/share/nginx/html/index.html':
  content => "<h1>Welcome to nginx-v1.pp By DIALLO on puppet sososo</h1>",
}

**********************************************************************************

#Diallo
package { 'nginx':
  ensure => 'present',
}

service { 'nginx':
  ensure    => 'running',
  enable    => 'true',
  #nginx redemarre que si exécution de package ou de file
  subscribe => [
    Package['nginx'],
    File['/usr/share/nginx/html/index.html'],
  ],
}

#eventuelement file notifie le service nginx,
file { '/usr/share/nginx/html/index.html':
  content => "<h2>Welcome to nginx-v2.pp By DIALLO on puppet server</h2>",
  notify => Service['nginx'],
}



***********************************************************************************

#Diallo
$app = "nginx"

package { 'install app':
  name   => $app,
  ensure => 'installed',
}

service { 'start app':
  name      => $app,
  ensure    => 'running',
  enable    => 'true',
  #nginx redemarre que si exécution de package ou de file
  subscribe => [
    Package['install app'],
    File['/usr/share/nginx/html/index.html'],
  ],
}

#eventuelement file notifie le service nginx,
file { '/usr/share/nginx/html/index.html':
  content => "<h2>Welcome to nginx-v3.pp By DIALLO on puppet server</h2>",
  notify  => Service['start app'],
}


*********************************************************************************
#Diallo
$app = "nginx"

package { 'install app':
  name   => $app,
  ensure => 'installed',
}

service { 'start app':
  name      => $app,
  ensure    => 'running',
  enable    => 'true',
  #nginx redemarre que si exécution de package ou de file
  subscribe => [
    Package['install app'],
    File['/usr/share/nginx/html/index.html'],
  ],
}

#eventuelement file notifie le service nginx,
if $osfamily == 'RedHat' {
  file { '/usr/share/nginx/html/index.html':
    content => "<h2>Welcome to nginx-v4.pp By DIALLO on puppet server</h2>",
    notify  => Service['start app'],
  }
}



