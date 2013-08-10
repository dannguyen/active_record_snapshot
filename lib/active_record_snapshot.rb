require 'hashie'
require 'active_record'
require 'active_support'

module ActiveRecordSnapshot
end

include ActiveRecordSnapshot
require 'active_record_snapshot/snapped'
require 'active_record_snapshot/snapshot'