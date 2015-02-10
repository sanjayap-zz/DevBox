class php56 {

    # Include webtatic repo for Centos 6
    exec { "install_webtatic_repo":
        command => "/bin/rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm",
        creates => "/etc/yum.repos.d/webtatic.repo"
    }

    # Install PHP 5.6 packages requirements
    package { [
        "php56w", 
        "php56w-common",
        "php56w-opcache",
        "php56w-pdo",
        "php56w-xml",
        "php56w-pecl-memcache",
        "php56w-soap",
        "php56w-gd",
        "php56w-mbstring",
        "php56w-mysql",
        "php56w-bcmath",
        "php56w-mcrypt",
        "php56w-devel",
        "php56w-pecl-xdebug",
        "php56w-fpm"
        ]:
        ensure => latest,
        require => [ Exec["install_webtatic_repo"] ]
    }
    
    # Install FPM for processing of PHP requests via Nginx
    service { "php-fpm":
        ensure => running,
        require => [ Package["php56w-fpm"] ]
    }

    # Install files
    file { 
        "/etc/php.ini":
            ensure => present,
            owner  => root,
            group  => root,
            mode   => "0644",
            source => "puppet:///modules/php56/php.ini";

        "/var/www/html/phpinfo.php":
            ensure => present,
            source => "puppet:///modules/php56/phpinfo.php",
            owner => root,
            group => root,
            mode => "0644";

        "/usr/local/share/xdebug":
            ensure => directory;
            
        "/usr/local/share/xdebug/xdebug-cli-disable.sh":
            source => "puppet:///modules/php56/xdebug-cli-disable.sh",
            ensure => present,
            mode => "0644",
            require => File["/usr/local/share/xdebug"];
            
        "/usr/local/share/xdebug/xdebug-cli-enable.sh":
            source => "puppet:///modules/php56/xdebug-cli-enable.sh",
            ensure => present,
            mode => "0644",
            require => File["/usr/local/share/xdebug"];
    }

    exec { "install_composer":
        command => "/usr/bin/curl -s https://getcomposer.org/installer | /usr/bin/php -- --install-dir=/tmp && cp /tmp/composer.phar /usr/local/bin/composer",
        creates => "/usr/local/bin/composer",
        require => [ Package["curl"], Package["php56w"] ]
    }
}