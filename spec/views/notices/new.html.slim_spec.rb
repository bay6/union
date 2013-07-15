require 'spec_helper'

describe "notices/new" do
  before(:each) do
    assign(:notice, stub_model(Notice,
      :title => "MyString",
      :content => "MyText",
      :user => nil
    ).as_new_record)
  end

  it "renders new notice form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", notices_path, "post" do
      assert_select "input#notice_title[name=?]", "notice[title]"
      assert_select "textarea#notice_content[name=?]", "notice[content]"
      assert_select "input#notice_user[name=?]", "notice[user]"
    end
  end
end
