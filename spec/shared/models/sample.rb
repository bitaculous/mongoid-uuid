# = Sample
#
# Sample class for testing purpose.
class Sample
  include Mongoid::Document
  include Mongoid::UUID

  # === Configuration ===

  # Store documents in the collection named `samples`.
  store_in collection: 'samples'

  # === Fields ===

  field :name, type: String

  # === Validations ===

  validates :name, presence: true, uniqueness: true, length: { maximum: 255 }

  # === Indexes ===

  index({ name: 1 }, name: 'name_index')
end