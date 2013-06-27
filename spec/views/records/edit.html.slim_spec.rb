require 'spec_helper'

describe "records/edit" do
  before(:each) do
    @record = assign(:record, stub_model(Record,
      :project => nil,
      :user => nil,
      :category => "MyString"
    ))
  end

  it "renders the edit record form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", record_path(@record), "post" do
      assert_select "input#record_project[name=?]", "record[project]"
      assert_select "input#record_user[name=?]", "record[user]"
      assert_select "input#record_category[name=?]", "record[category]"
    end
  end
end
