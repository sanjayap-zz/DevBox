class ntp {
      package { "tzdata":
        ensure => installed
      }
      
      file { "/etc/localtime":
        require => Package["tzdata"],
        source => "/usr/share/zoneinfo/Australia/Melbourne",
      }

      package { 'ntp':
        ensure => installed,
      }
      
      file { 'ntp.conf':
        path    => '/etc/ntp.conf',
        ensure  => file,
        require => Package['ntp'],
        source  => "/vagrant/modules/ntp/files/ntp.conf"
      }
      service { 'ntpd':
        name      => ntpd,
        ensure    => running,
        enable    => true,
        subscribe => File['ntp.conf'],
      }
}
