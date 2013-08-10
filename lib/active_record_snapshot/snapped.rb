module ActiveRecordSnapshot
  module Snapped

    extend ActiveSupport::Concern

    included do
      class_attribute :snapshot_config
      self.snapshot_config = Hashie::Mash.new 
      self.snapshot_class_name = [self.class.name, 'snapshots'].join('_') 
      
      has_many :snapshots, 
        class_name: self.snapshot_class_name, 
        foreign_key: [self.class.name, 'snapped_record_id'].join('_')
    end


    module ClassMethods 

      # usage:
      # snapshot :view_count, when: :dirty
      def snapshot(attribute_name, opts={})
      end
    end # classmethods


    def save_snapshot
      Snapshot.snap(self)
    end
  end

end