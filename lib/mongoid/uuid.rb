require 'bson'
require 'mongoid'
require 'uuid'

require 'mongoid/uuid/field'
require 'mongoid/uuid/validator'

module Mongoid
  module UUID #:nodoc:
    extend ActiveSupport::Concern

    include Field

    def self.validate(uuid)
      uuid.class.to_s == 'BSON::Binary' && uuid.type == :uuid && ::UUID.validate(uuid.data)
    end
  end
end

ActiveModel::Validations.send :include, Mongoid::UUID::Validator