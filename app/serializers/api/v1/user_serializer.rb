class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :high_score
end
