class Tag < ApplicationRecord
  has_many :post_tags
  has_many :posts, through: :post_tags

  validates :content, presence: true,
    length: {maximum: Settings.tags.maximum_tag_content}
end
