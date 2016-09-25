#
#
class exitmodule::master (
  $server_version = '2.6.0-1.el7',
  $repo_keys      = 'https://yum.puppetlabs.com/RPM-GPG-KEY-puppet https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs'
)
{
  yumrepo { 'puppetlabs-pc1':
    ensure   => 'present',
    baseurl  => 'http://yum.puppetlabs.com/el/7/PC1/$basearch',
    gpgkey   => $repo_keys,
    enabled  => '1',
    gpgcheck => '1'
  }
  
  package { 'puppetserver':
    ensure  => $server_version,
    require => Yumrepo['puppetlabs-pc1']
  }
  
  service { 'puppetserver':
    ensure  => 'running',
    enable  => 'true',
    require => Package['puppetserver']
  }
}