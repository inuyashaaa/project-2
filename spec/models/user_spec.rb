require "rails_helper"

RSpec.describe User, type: :model do
  context "associations" do
    it {expect have_many :posts}
    it {expect have_many :comments}
    it {expect have_many :active_relationships}
    it {expect have_many :passive_relationships}
    it {expect have_many :following}
    it {expect have_many :followers}
  end

  describe "validations" do
    it {expect validate_presence_of :name}
    it do
     expect validate_length_of(:name).is_at_most Settings.users.maximum_name
    end
  end
end
