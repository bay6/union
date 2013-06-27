require 'spec_helper'

describe "projects/new" do
  before(:each) do
    assign(:project, stub_model(Project,
      :name => "MyString",
      :website => "MyString",
      :description => "MyText",
      :grade => nil,
      :user => nil,
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", projects_path, "post" do
      assert_select "input#project_name[name=?]", "project[name]"
      assert_select "input#project_website[name=?]", "project[website]"
      assert_select "textarea#project_description[name=?]", "project[description]"
      assert_select "input#project_grade[name=?]", "project[grade]"
      assert_select "input#project_user[name=?]", "project[user]"
      assert_select "input#project_status[name=?]", "project[status]"
    end
  end
end
