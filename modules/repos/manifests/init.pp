class repos{
     package {"webtatic":
     ensure => present,
     source => "http://mirror.webtatic.com/yum/el6/latest.rpm",
     provider => rpm,
     } 
}
