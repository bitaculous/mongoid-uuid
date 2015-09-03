module Mongoid
  module UUID
    module Field #:nodoc:
      extend ActiveSupport::Concern

      included do
        # === Field ===

        field :uuid, type: BSON::Binary, default: -> { BSON::Binary.new ::UUID.new.generate, :uuid }, pre_processed: true

        attr_readonly :uuid

        # === Validation ===

        validates :uuid, uniqueness: true, uuid: true

        # === Indexes ===

        index({ uuid: 1 }, unique: true, name: 'uuid_index')
      end
    end
  end
end