require 'spec_helper'

describe "records/new" do
  before(:each) do
    assign(:record, stub_model(Record,
      :project => nil,
      :user => nil,
      :category => "MyString"
    ).as_new_record)
  end

  it "renders new record form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", records_path, "post" do
      assert_select "input#record_project[name=?]", "record[project]"
      assert_select "input#record_user[name=?]", "record[user]"
      assert_select "input#record_category[name=?]", "record[category]"
    end
  end
end
