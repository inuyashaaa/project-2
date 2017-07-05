require "rails_helper"

RSpec.describe "home/index", type: :view do
  it "should find tags" do
    render
    expect(rendered).to have_tag "h3.tittle"
  end
end
