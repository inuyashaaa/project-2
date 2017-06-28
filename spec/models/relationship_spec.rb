require "rails_helper"

RSpec.describe Relationship, type: :model do
  context "associations" do
    it {is_expected.to belong_to :follower}
    it {is_expected.to belong_to :followed}
  end

  describe "validations" do
    it {expect validate_presence_of :follower}
    it do
      expect validate_numericality_of(:follower).only_integer
    end
    it {expect validate_presence_of :followed}
    it do
      expect validate_numericality_of(:followed).only_integer
    end
  end
end
