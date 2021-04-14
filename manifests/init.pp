#
#
#
class profile_openldap (
  String $database,
  String $rootdn,
  String $rootpw,
) {
  class { 'openldap::server': }

  openldap::server::database { $database:
    ensure    => present,
    directory => '/var/lib/ldap',
    rootdn    => $rootdn,
    rootpw    => $rootpw,
  }


  firewall { '00389 allow slapd':
    dport  => 389,
    action => accept,
  }
}
