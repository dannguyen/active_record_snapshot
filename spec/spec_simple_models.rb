ActiveRecord::Schema.define do
  create_table :books do |t|
    t.string :title
    t.integer :year
    t.float :price
    t.timestamps
  end

  create_table :book_snapshots do |t|
    t.integer :snapped_id
    t.datetime :snapped_at
    t.string :title
    t.float :price
  end
end



class Book < ActiveRecord::Base 
  include ActiveRecordSnapshot::Snapped
end

class BookSnapshot < ActiveRecordSnapshot::Snapshot

end

