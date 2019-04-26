class FriendSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :dob
  has_many :events
end
