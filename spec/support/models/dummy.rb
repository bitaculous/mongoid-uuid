# = Dummy
#
# Dummy class for testing purpose.
class Dummy
  include Mongoid::Document
  include Mongoid::UUID

  field :name
end