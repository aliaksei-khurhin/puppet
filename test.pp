node default {

if $::hostname == 'puppet-master' {

  yumrepo { 'puppetlabs-pc1':
    ensure   => 'present',
    baseurl  => 'http://yum.puppetlabs.com/el/7/PC1/$basearch',
    gpgkey   => 'https://yum.puppetlabs.com/RPM-GPG-KEY-puppet https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
    enabled  => '1',
    gpgcheck => '1'
  }
  
  package { 'puppetserver':
    ensure  => 'latest',
    require => Yumrepo['puppetlabs-pc1']
  }
  
  service { 'puppetserver':
    ensure  => 'running',
    require => Package['puppetserver']
  }
}

else {
  yumrepo { 'puppetlabs-pc1':
    ensure   => 'present',
    baseurl  => 'http://yum.puppetlabs.com/el/7/PC1/$basearch',
    gpgkey   => 'https://yum.puppetlabs.com/RPM-GPG-KEY-puppet https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
    enabled  => '1',
    gpgcheck => '1'
  }

  package { 'puppet-agent':
    ensure  => 'latest',
    require => Yumrepo['puppetlabs-pc1']
  }

  service { 'puppet':
    ensure  => 'running',
    require => Package['puppet-agent']
  }
}
}

