module ActiveRecordSnapshot
  module Snapped

    extend ActiveSupport::Concern

    included do
      class_attribute :snapshot_config
      self.snapshot_config = Hashie::Mash.new 
      
      has_many :snapshots, 
        class_name: self.snapshot_class_name, 
        foreign_key: 'snapped_id'
    end


    module ClassMethods 

      def dirty_snapshot(arr, opts={})
        atts_array = Array(arr)
        atts_array.each do |att|
          snapshot att, :when => :dirty
        end
      end

      def always_snapshot(arr, opts={})
        atts_array = Array(arr)
        atts_array.each do |att|
          snapshot att, :when => :always
        end
      end
      


      def snapshot_class_name
        [self.name.singularize, 'Snapshot'].join
      end

      def snapshot_table_name
        snapshot_class_name.tableize
      end


      def snapped_attributes
        snapshot_config
      end

      # usage:
      # snapshot :view_count, when: :dirty
      def snapshot(attr_name, opts={})
        mash_opts = Hashie::Mash.new(opts)

        if !self.attribute_names.include?(attr_name.to_s)
          raise ActiveRecord::UnknownAttributeError, "#{attr_name} is not an attribute of #{self.name}"
        end

        att_sym = attr_name.to_sym

        # code smell TODO, make SnapshotConfig its own class, rather than a managed Mash
        config_mash = Hashie::Mash.new


        val_when = case mash_opts[:when]
        when :always
          :always
        when :dirty
          :dirty
        when nil
          :dirty
        else
          raise ArgumentError, "#{mash_opts[:when]} is not a valid :when option. Only :dirty and :always allowed"
        end

        config_mash[:when] = val_when

        self.snapshot_config[att_sym] = config_mash
      end
    end # classmethods


    def save_snapshot
      # this should be refactored somewhere...
      record = self 
      snapshot_mashie = Hashie::Mash.new 
      

      record.class.snapped_attributes.each_pair do |att_name, att_config|
        att_str = att_name.to_s
        # if there is a change, this copies the prior version. If not, this stores the current attribute value
        
        is_att_changed = !(record.changes[att_str].nil? )
        previous_or_current_val = is_att_changed ? record.changes[att_str][-1] : record.attributes[att_str]

        if att_config[:when] == :always
          # when :always, we save either the previous value (if changed) or the current value
          snapshot_mashie[att_name] = previous_or_current_val
        elsif att_config[:when] == :dirty && is_att_changed
          snapshot_mashie[att_name] = previous_or_current_val
        end
      end

      # now create snapshot_record with snapshot_mashie as the assigned attributes
      # TODO: code smell, according to Demeter
      new_snapshot = self.class.snapshot_class_name.constantize.create(snapshot_mashie)

      return new_snapshot
    end

  end

end