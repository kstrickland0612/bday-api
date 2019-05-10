class EventSerializer < ActiveModel::Serializer
  attributes :id, :category, :date, :action, :is_annual, :user_id

  has_one :friend
  has_one :user
end
