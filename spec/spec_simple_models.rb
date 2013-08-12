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



ActiveRecord::Schema.define do
  create_table :movies do |t|
    t.string :title
    t.integer :release
    t.integer :year
    t.float :gross
    t.integer :rank
    t.timestamps
  end

  create_table :movie_snapshots do |t|
    t.integer :snapped_id
    t.datetime :snapped_at

    t.string :title
    t.integer :release
    t.integer :year
    t.float :gross
    t.integer :rank
  end
end

class Movie < ActiveRecord::Base 
  include ActiveRecordSnapshot::Snapped 
  dirty_snapshot [:title, :release]
  always_snapshot [:gross, :rank]
end

class MovieSnapshot < ActiveRecord::Base
  include ActiveRecordSnapshot::Snapshot
end


