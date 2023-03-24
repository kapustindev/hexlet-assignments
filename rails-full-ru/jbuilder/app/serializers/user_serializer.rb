class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :address, :first_name

  has_many :posts
end
