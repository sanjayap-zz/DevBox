node 'web.intrepidtravel.com.dev.local'{
	class { '::ntp':
  		servers => [ '10.2.1.2', '10.1.1.2' ],
	}
	include pupi
	include repos
	include nginx
	include php56
	include peak-tools
	
}

node 'db.intrepidtravel.com.dev.local'{	
	class { '::ntp':
  		servers => [ '10.2.1.2', '10.1.1.2' ],
	}

	class { "mysql":
 		source => "/vagrant/files/my.cnf",
    	}
	include pupi
	include peak-tools
}
