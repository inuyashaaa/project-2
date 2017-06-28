require "rails_helper"

RSpec.describe PostTag, type: :model do
  context "associations" do
    it {is_expected.to belong_to :post}
    it {is_expected.to belong_to :tag}
  end

  describe "validations" do
    it {expect validate_presence_of :post}
    it do
      expect validate_numericality_of(:post).only_integer
    end
    it {expect validate_presence_of :tag}
    it do
      expect validate_numericality_of(:tag).only_integer
    end
  end
end
