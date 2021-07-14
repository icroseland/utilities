# install puppdb and postgres
#
class utilities::db_setup(
$puppetdb_server = $::fqdn,
$postgresql_server = $::fqdn
){
if ($puppetdb_server == $::fqdn) and ($postgresql_server == $::fqdn ){
  class { 'puppetdb':
  manage_firewall => false,
  }
}
if ($puppetdb_server != $::fqdn) and ($postgresql_server == $::fqdn ){
  class { 'puppetdb::database::postgresql':
    listen_addresses => $postgres_server,
    postgresql_ssl_on => true,
    puppetdb_server => $puppetdb_server,
    manage_firewall => false,
    }
}
if ($puppetdb_server == $::fqdn) and ($postgresql_server != $::fqdn ){
  class { 'puppetdb::server':
    database_host => $postgres_server,
    postgresql_ssl_on => true,
    manage_firewall => false,
    }
}
}
