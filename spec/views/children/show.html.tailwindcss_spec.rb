require 'rails_helper'

RSpec.describe "children/show", type: :view do
  before(:each) do
    assign(:child, Child.create!(
      name: "Name",
      description: "Description",
      user: nil,
      gender: "Gender",
      profile: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Gender/)
    expect(rendered).to match(/MyText/)
  end
end
