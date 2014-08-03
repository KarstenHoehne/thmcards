#add simple couchdb instance
class couchdb{

	package { "couchdb": 
		ensure => "latest",
		require => Exec["apt-get update"]
	}

	file_line { "couchdb-bind_address-0.0.0.0":
		notify  => Service["couchdb"],
		path => "/etc/couchdb/local.ini",
		match => ";?bind_address",
		line => "bind_address = 0.0.0.0"
	}
	
	service { "couchdb":
		ensure => "running",
		enable => true,
		require => [Package["couchdb"], File_line["couchdb-bind_address-0.0.0.0"]]
	}
	
}