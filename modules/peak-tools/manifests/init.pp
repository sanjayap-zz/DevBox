class peak-tools {

  vcsrepo { "/opt/projects/tools":
      ensure   => present,
      provider => git,
      source   => "git@github.com:peak-adventure-travel/tools.git",
      revision => "master",
      user     => "vagrant",
      group    => "vagrant",
      require  => [ 
          File["/opt/projects"], 
          File["/home/vagrant/.ssh/id_rsa"], 
          Sshkey["github.com"], 
          Package["git"], 
      ],
  }

}
