class frontiersquid::install inherits frontiersquid::params {
  package { "frontier-release":
    ensure   => present,
    source   => "http://frontier.cern.ch/dist/rpms/RPMS/noarch/frontier-release-1.0-1.noarch.rpm",
    provider => yum,
  }

  package { "frontier-squid":
    ensure  => present,
    require => Package['frontier-release'],
    notify  => Service["frontier-squid"],
  }

  service { "frontier-squid":
    ensure => "running",
    enable => true,
  }
}