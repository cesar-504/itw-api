class ObjectiveSerializer < ActiveModel::Serializer
  attributes :first_name,:last_name,:description
  has_many :publications
end
