require "rails_helper"

RSpec.describe Comment, type: :model do
  context "associations" do
    it {is_expected.to belong_to :user}
    it {is_expected.to belong_to :post}
  end

  describe "validations" do
    it {expect validate_presence_of :content}
    it do
      expect validate_length_of(:content)
        .is_at_most Settings.comments.maximum_comtents_length
    end
  end
end
