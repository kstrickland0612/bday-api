class EventSerializer < ActiveModel::Serializer
  attributes :id, :category, :date, :action, :user_id

  has_one :friend
  has_one :user
end
