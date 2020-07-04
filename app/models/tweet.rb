class Tweet < ApplicationRecord
  belongs_to :user,optional: true
  has_many :messages
  validates :image, presence: true
end