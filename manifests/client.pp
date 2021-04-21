# manage puppet client on a node
class utilities::client(){
# Agent and cron (or daemon):
class { '::puppet':
  agent   => true,
  runmode => 'cron'
  }
}