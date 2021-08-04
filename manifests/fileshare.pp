# build a fileshare host.
class utilities::fileshare(
  $vsftpd_user_conf = undef,
  $my_cert = undef,
  $pam_users = undef,
  $site_name = undef,
  $listen_port = undef,
  $access_log = undef,
  $error_log = undef,
  $ssl = undef,
  $ssl_certificate = undef,
  $ssl_certificate_key = undef,
  $locations_hash = undef
){
#check if we have a cert
$my_cert_check = find_file($my_cert)
if $my_cert_check {
  notify {"No cert found at ${my_cert}, load the cert manually and then re-run puppet":}
  if $my_cert == undef {
    notify {'The Cert is not defined in hiera':}
  }
  } else {
  include vsftpd

  file { '/etc/vsftpd':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Package['vsftpd'],
    }
  file { '/etc/vsftpd/vsftpd_user_conf':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => File['/etc/vsftpd'],
    }
  $vsftpd_user_conf.each |String $user_conf|{
    file {"/etc/vsftpd/vsftpd_user_conf/${user_conf}":
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => 'local_root=/data/ftp/',
      require => Package['vsftpd'],
      }
      }
include nginx
  }
# setup the nginx allowed user files for pam.d
file { '/etc/nginx/pam_users':
  ensure  => 'directory',
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  require => Package['nginx'],
  }
$pam_users.each |String $pam_user| {
  file {"/etc/nginx/pam_users/${pam_user}.allowed":
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => $pam_user,
    require => File['/etc/nginx/pam_users'],
    }
  }
package { 'libnginx-mod-http-auth-pam':
  ensure => 'present',
  notify => Service["${::nginx::service_name}"],
  }

}