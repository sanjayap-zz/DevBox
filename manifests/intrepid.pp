node 'web.intrepidtravel.com.dev.local'{
	class { selinux:
  		mode => 'disabled'
	}
	class { '::ntp':
  		servers => [ '10.2.1.2', '10.1.1.2' ],
	}
	class { 'motd':
  		template => 'motd.intrepid.web.dev.local',
	} 
	include repos
	include nginx
	include curl
	include php56
	include git
	include bash
	include memcached	
	
}

node 'db.intrepidtravel.com.dev.local'{	
	include bash
	class { selinux:
  		mode => 'disabled'
	}
	class { '::ntp':
  		servers => [ '10.2.1.2', '10.1.1.2' ],
	}
	class { 'motd':
  		template => 'motd.intrepid.db.dev.local',
	}
	class { "mysql":
 		source => "/vagrant/files/my.cnf",
    	}
}
