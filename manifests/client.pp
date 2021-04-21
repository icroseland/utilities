# manage puppet client on a node
class utilities::client(){
# Agent and cron (or daemon):
class { '::puppet':
  agent        => true,
  puppetmaster => $::puppet_server,
  ca_server    => $::puppet_server,
  runmode      => 'cron',
  environment  => $::environment,
  }
}