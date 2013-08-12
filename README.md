active_record_snapshot
======================

A simple gem for versioning selected fields of ActiveRecords.


````
class Book < ActiveRecord::Base
  include ActiveRecordSnapshot::Snapped 

end
````



