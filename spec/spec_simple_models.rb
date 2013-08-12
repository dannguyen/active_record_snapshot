ActiveRecord::Schema.define do
  create_table :books do |t|
    t.string :title
    t.integer :edition
    t.integer :year
    t.float :price
    t.integer :rank
    t.timestamps
  end

  create_table :book_snapshots do |t|
    t.integer :snapped_id
    t.datetime :snapped_at
    
    t.string :title
    t.integer :edition
    t.float :price
    t.integer :rank
  end
end



class Book < ActiveRecord::Base 
  include ActiveRecordSnapshot::Snapped

  snapshot :title # default: :dirty
  snapshot :price, when: :always
  snapshot :edition, when: :dirty
  snapshot :rank, when: :always
end

class BookSnapshot < ActiveRecord::Base
  include ActiveRecordSnapshot::Snapshot

end

