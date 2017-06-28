class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_tags
  has_many :tags, through: :post_tags

  validates :user, presence: true, numericality: {only_integer: true}
  validates :title, presence: true,
    length: {maximum: Settings.posts.maximum_title_length}
  validates :content, presence: true,
    length: {maximum: Settings.posts.maximum_content_length}
end
