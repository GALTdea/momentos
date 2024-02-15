require 'rails_helper'

RSpec.describe "children/new", type: :view do
  before(:each) do
    assign(:child, Child.new(
      name: "MyString",
      description: "MyString",
      user: nil,
      gender: "MyString",
      profile: "MyText"
    ))
  end

  it "renders new child form" do
    render

    assert_select "form[action=?][method=?]", children_path, "post" do

      assert_select "input[name=?]", "child[name]"

      assert_select "input[name=?]", "child[description]"

      assert_select "input[name=?]", "child[user_id]"

      assert_select "input[name=?]", "child[gender]"

      assert_select "textarea[name=?]", "child[profile]"
    end
  end
end
