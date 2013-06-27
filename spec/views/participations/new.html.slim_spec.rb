require 'spec_helper'

describe "participations/new" do
  before(:each) do
    assign(:participation, stub_model(Participation,
      :project => nil,
      :user => nil,
      :role => "MyString"
    ).as_new_record)
  end

  it "renders new participation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", participations_path, "post" do
      assert_select "input#participation_project[name=?]", "participation[project]"
      assert_select "input#participation_user[name=?]", "participation[user]"
      assert_select "input#participation_role[name=?]", "participation[role]"
    end
  end
end
