require 'spec_helper'

describe "repositories/new" do
  before(:each) do
    assign(:repository, stub_model(Repository,
      :avatar_url => "MyString",
      :description => "MyString",
      :html_url => "MyString",
      :name => "MyString",
      :starred_url => "MyString",
      :uid => "MyString"
    ).as_new_record)
  end

  it "renders new repository form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", repositories_path, "post" do
      assert_select "input#repository_avatar_url[name=?]", "repository[avatar_url]"
      assert_select "input#repository_description[name=?]", "repository[description]"
      assert_select "input#repository_html_url[name=?]", "repository[html_url]"
      assert_select "input#repository_name[name=?]", "repository[name]"
      assert_select "input#repository_starred_url[name=?]", "repository[starred_url]"
      assert_select "input#repository_uid[name=?]", "repository[uid]"
    end
  end
end
