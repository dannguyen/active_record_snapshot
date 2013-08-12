module ActiveRecordSnapshot
  module Snapped

    extend ActiveSupport::Concern

    included do
      class_attribute :snapshot_config

      self.snapshot_config = Hashie::Mash.new 
      
      has_many :snapshots, 
        class_name: self.snapshot_class_name, 
        foreign_key: [self.name, 'snapped_record_id'].join('_')
    end


    module ClassMethods 

      def snapshot_class_name
        [self.name.singularize, 'Snapshot'].join
      end

      def snapshot_table_name
        [self.name, 'snapshots'].join('_') 
      end

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