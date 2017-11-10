class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :high_score
end
