class Friend < ApplicationRecord
  has_many :events, :dependent => :delete_all
  belongs_to :user
  validates :user, presence: true
end
