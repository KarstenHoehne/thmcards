# download and install thm cards
class cards {
	include git
#	class {'nodejs':
#      manage_repo => true,
#    }

	$base_path = "/vagrant"
	$server_path = "$base_path/thm-cards"

#	git::repo { "thm-cards":
#		path => $server_path,
#		source => "https://github.com/KarstenHoehne/thmcards",
#		owner => "vagrant",
#		group => "vagrant"
#	}
	
	file {"/home/vagrant/init.sh":
		ensure => present,
		owner => "root",
		group => "root",
		mode => "0755",
		source => "puppet:///modules/cards/init.sh"
	}
	
	file {"/home/vagrant/start.sh":
		ensure => present,
		owner => "root",
		group => "root",
		mode => "0755",
		source => "puppet:///modules/cards/start.sh"
	}
	
#	file {"/home/vagrant/default_badges.json":
#		ensure => present,
#		owner => "root",
#		group => "root",
#		mode => "0644",
#		source => "puppet:///modules/cards/default_badges.json"
#	}
	
#	nodejs::npm { '/vagrant/thm-cards:express':
#		ensure  => present,
#		install_opt => '--no-bin-links',
#		version => '3.4.0',
#	}
}