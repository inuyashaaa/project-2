require "rails_helper"

RSpec.describe "home/contact", type: :view do
  it "should find tags" do
    render
    expect(rendered).to have_tag("div.contact")
  end
end
