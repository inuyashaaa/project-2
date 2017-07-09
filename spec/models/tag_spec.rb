require "rails_helper"

RSpec.describe Tag, type: :model do
  context "associations" do
    it {expect have_many :post_tags}
    it {expect have_many :posts}
  end

  describe "validations" do
    it {expect validate_presence_of :name}
    it do
      expect validate_length_of(:name)
        .is_at_most Settings.tags.maximum_tag_content
    end
  end
end
