node 'web.intrepidtravel.com.uat.local'{
	class { '::ntp':
  		servers => [ '10.2.1.2', '10.1.1.2' ],
	}
	include repos
	include nginx
}

node 'db.intrepidtravel.com.uat.local'{	
	class { '::ntp':
  		servers => [ '10.2.1.2', '10.1.1.2' ],
	}

	class { "mysql":
 		source => "/vagrant/files/my.cnf",
    	}
}
