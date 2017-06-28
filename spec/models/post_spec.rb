require "rails_helper"

RSpec.describe Post, type: :model do
  context "associations" do
    it {is_expected.to belong_to :user}
    it {expect have_many :comments}
    it {expect have_many :post_tags}
    it {expect have_many :tags}
  end
  describe "validations" do
    it {expect validate_presence_of :user}
    it do
      expect validate_numericality_of(:user).only_integer
    end
    it {expect validate_presence_of :title}
    it do
      expect validate_length_of(:title)
        .is_at_most Settings.posts.maximum_title_length
    end
    it {expect validate_presence_of :content}
    it do
      expect validate_length_of(:content)
        .is_at_most Settings.posts.maximum_content_length
    end
  end
end
