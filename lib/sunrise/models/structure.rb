# encoding: utf-8
module Sunrise
  module Models
    module Structure
      def self.included(base)
        base.send :include, InstanceMethods
        base.send :extend,  ClassMethods
      end
      
      module ClassMethods
        def self.extended(base)
          base.send(:include, Utils::Header)
          base.send(:include, ::PageParts::ActiveRecordExtension)
          base.class_eval do
            enumerated_attribute :structure_type, :id_attribute => :kind
            enumerated_attribute :position_type, :id_attribute => :position
            
            validates_presence_of :title
            validates_numericality_of :position, :only_integer => true
            
            acts_as_nested_set
            set_callback :move, :after, :update_depth
            
            extend ::FriendlyId
            friendly_id :title, :use => :slugged
            
            scope :visible, where(:is_visible => true)
            scope :with_kind, proc {|structure_type| where(:kind => structure_type.id) }
            scope :with_depth, proc {|level| where(:depth => level.to_i) }
            scope :with_position, proc {|position_type| where(:position => position_type.id) }
          end
        end
      end
      
      module InstanceMethods
        def moveable?
          return true if new_record?
          !root?
        end
        
        # Don't change slug on update
        def should_generate_new_friendly_id?
          new_record?
        end
      end
    end
  end
end
