class PostTag < ApplicationRecord
  belongs_to :post
  belongs_to :tag

  validates :post, presence: true, numericality: {only_integer: true}
  validates :tag, presence: true, numericality: {only_integer: true}
end
