require 'rails_helper'

RSpec.describe "children/edit", type: :view do
  let(:child) {
    Child.create!(
      name: "MyString",
      description: "MyString",
      user: nil,
      gender: "MyString",
      profile: "MyText"
    )
  }

  before(:each) do
    assign(:child, child)
  end

  it "renders the edit child form" do
    render

    assert_select "form[action=?][method=?]", child_path(child), "post" do

      assert_select "input[name=?]", "child[name]"

      assert_select "input[name=?]", "child[description]"

      assert_select "input[name=?]", "child[user_id]"

      assert_select "input[name=?]", "child[gender]"

      assert_select "textarea[name=?]", "child[profile]"
    end
  end
end
