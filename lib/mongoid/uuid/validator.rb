module Mongoid
  module UUID
    module Validator #:nodoc:
      # = UuidValidator
      #
      # The UUID validator class, inherited from `ActiveModel::EachValidator`.
      class UuidValidator < ActiveModel::EachValidator
        # Ensures that every value is of a valid compact UUID format.
        def validate_each(record, attribute, value)
          record.errors.add attribute, :invalid_uuid unless Mongoid::UUID.validate value
        end
      end
    end
  end
end