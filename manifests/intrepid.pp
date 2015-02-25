node 'web.intrepidtravel.com.dev.internal'{
	class { selinux:
  		mode => 'disabled'
	}
	class { '::ntp':
  		servers => [ '10.2.1.2', '10.1.1.2' ],
	}
	class { 'motd':
  		template => 'motd.intrepid.web.dev.internal',
	} 
	include repos
	include nginx
	include curl
	include php56
	include git
	include bash
	include memcached		
	include '::rabbitmq'
	
}

node 'db.intrepidtravel.com.dev.internal'{	
	include bash
	class { selinux:
  		mode => 'disabled'
	}
	class { '::ntp':
  		servers => [ '10.2.1.2', '10.1.1.2' ],
	}
	class { 'motd':
  		template => 'motd.intrepid.db.dev.internal',
	}
	class { "mysql":
 		source => "/vagrant/files/my.cnf",
    	}
}
