class HeroeSerializer < ActiveModel::Serializer
  belongs_to :universe

  attributes :id, :name, :real_name, :species, :abilities
end
