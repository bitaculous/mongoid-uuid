require 'bson'
require 'mongoid'
require 'uuid'

require 'mongoid/uuid/validator'

module Mongoid
  module UUID #:nodoc:
    extend ActiveSupport::Concern

    included do
      # === Fields ===

      field :uuid, type: BSON::Binary, default: -> { BSON::Binary.new ::UUID.new.generate, :uuid }, pre_processed: true

      attr_readonly :uuid

      # === Validations ===

      validates :uuid, uniqueness: true, uuid: true

      # === Indexes ===

      index({ uuid: 1 }, unique: true, name: 'uuid_index')
    end

    def self.validate(uuid)
      uuid.class.to_s == 'BSON::Binary' && uuid.type == :uuid && ::UUID.validate(uuid.data)
    end
  end
end

ActiveModel::Validations.send :include, Mongoid::UUID::Validator