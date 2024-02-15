require 'rails_helper'

RSpec.describe "children/index", type: :view do
  before(:each) do
    assign(:children, [
      Child.create!(
        name: "Name",
        description: "Description",
        user: nil,
        gender: "Gender",
        profile: "MyText"
      ),
      Child.create!(
        name: "Name",
        description: "Description",
        user: nil,
        gender: "Gender",
        profile: "MyText"
      )
    ])
  end

  it "renders a list of children" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Gender".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
