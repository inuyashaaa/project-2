class Relationship < ApplicationRecord
  belongs_to :follower, class_name: User.name
  belongs_to :followed, class_name: User.name

  validates :follower, presence: true, numericality: {only_integer: true}
  validates :followed, presence: true, numericality: {only_integer: true}
end
