class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :user_id, presence: true, numericality: {only_integer: true}
  validates :title, presence: true,
    length: {maximum: Settings.posts.maximum_title_length}
  validates :content, presence: true

  scope :created_at_desc, ->{order created_at: :desc}
  scope :select_post, ->{select :id, :title, :content, :picture, :created_at, :user_id}
  scope :load_feed, ->(following_ids, id) do
    where "user_id IN (?) OR user_id = ?", following_ids, id
  end

  mount_uploader :picture, PictureUploader

  def all_tags=names
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(", ")
  end
end
