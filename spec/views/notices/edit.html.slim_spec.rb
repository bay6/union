require 'spec_helper'

describe "notices/edit" do
  before(:each) do
    @notice = assign(:notice, stub_model(Notice,
      :title => "MyString",
      :content => "MyText",
      :user => nil
    ))
  end

  it "renders the edit notice form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", notice_path(@notice), "post" do
      assert_select "input#notice_title[name=?]", "notice[title]"
      assert_select "textarea#notice_content[name=?]", "notice[content]"
      assert_select "input#notice_user[name=?]", "notice[user]"
    end
  end
end
