module ActiveRecordSnapshot
  module Snapshot 
    extend ActiveSupport::Concern

    included do
      before_save :set_snapped_at

    #  belongs_to :snapped, 
    #    class_name: self.snapped_class_name, 
    #    foreign_key: 'snapped_id'

      # TODO: refactor safely
      self.attribute_names.each do |att|
        attr_accessible att
      end      
    end



    module ClassMethods
    end


    private 

    def set_snapped_at 
      self.snapped_at = Time.now
      true
    end

  end


end