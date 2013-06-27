require 'spec_helper'

describe "grades/edit" do
  before(:each) do
    @grade = assign(:grade, stub_model(Grade,
      :name => "MyString",
      :description => "MyText",
      :weights => 1
    ))
  end

  it "renders the edit grade form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", grade_path(@grade), "post" do
      assert_select "input#grade_name[name=?]", "grade[name]"
      assert_select "textarea#grade_description[name=?]", "grade[description]"
      assert_select "input#grade_weights[name=?]", "grade[weights]"
    end
  end
end
