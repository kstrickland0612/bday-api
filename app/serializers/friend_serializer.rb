class FriendSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :dob, :user_id

  has_many :events
  has_one :user
end
