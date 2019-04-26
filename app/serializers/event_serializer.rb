class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :category, :date, :action
  has_one :friend
end
