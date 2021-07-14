# frozen_string_literal: true

require 'spec_helper'
require 'puppet/type/puppetdb_fact'

RSpec.describe 'the puppetdb_fact type' do
  it 'loads' do
    expect(Puppet::Type.type(:puppetdb_fact)).not_to be_nil
  end
end
