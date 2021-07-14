# @setup puppetdb and inform the master
class utilities::puppetdb(){
class { 'puppetdb': }
@@ini_setting { 'puppetdb_host':
  ensure            => present,
  path              => '/etc/facter/facts.d/puppetmaster.txt',
  key_val_seperator => '=',
  setting           => 'puppetdb_host',
  value             => $::fqdn
  }
@@ini_setting { 'server_reports':
  ensure            => present,
  path              => '/etc/facter/facts.d/puppetmaster.txt',
  key_val_seperator => '=',
  setting           => 'server_reports',
  value             => 'puppetdb'
  }
}