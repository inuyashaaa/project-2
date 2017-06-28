class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: true,
    length: {maximum: Settings.comments.maximum_comtents_length}
end
