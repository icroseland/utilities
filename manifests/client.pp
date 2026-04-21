# manage puppet client on a node
class utilities::client(){
# Agent and cron (or daemon):
class { '::puppet':
  agent        => true,
  puppetmaster => $facts['puppet_server'],
  ca_server    => $facts['puppet_server'],
  runmode      => 'cron',
  environment  => $facts['environment'],
  }
}