Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

# Strangely, bash is not the default...
user { "vagrant":
  ensure => present,
  shell  => "/bin/bash"
}

package {"dos2unix": 
	ensure => "latest",
	require => Exec["apt-get update"]
}

include system-update
include stdlib
include apt
# include git
include motd
include couchdb
# include nodejs
class {'nodejs':
      manage_repo => true,
  }
include cards
