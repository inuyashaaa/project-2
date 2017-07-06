require "rails_helper"

RSpec.describe "home/about", type: :view do
  it "should find tags" do
    render
    expect(rendered).to have_tag "div.about-content"
  end
end
