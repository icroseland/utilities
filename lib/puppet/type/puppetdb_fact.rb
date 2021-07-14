# frozen_string_literal: true

require 'puppet/resource_api'

Puppet::ResourceApi.register_type(
  name: 'puppetdb_fact',
  docs: <<-EOS,
@summary a puppetdb_fact type
@example
puppetdb_fact { 'puppetdb_hostname_fqdn':
  ensure => 'present',
}

This type provides Puppet with the capabilities to manage ...
The puppetdb_host=hostname.domain, and server_reports=puppetdb  lines 
in /etc/facter/facts.d/puppetmaster.txt


If your type uses autorequires, please document as shown below, else delete
these lines.
**Autorequires**:
* `Package[foo]`
EOS
  features: [],
  attributes: {
    ensure: {
      type: 'Enum[present, absent]',
      desc: 'Whether this resource should be present or absent on the target system.',
      default: 'present',
    },
    name: {
      type: 'String',
      desc: 'puppetdb_fact as hostname_fqdn',
      behaviour: :namevar,
    },
  },
)
