require 'spec_helper'

describe "commits/new" do
  before(:each) do
    assign(:commit, stub_model(Commit,
      :committer_email => "MyString",
      :committer_name => "MyString",
      :html_url => "MyString",
      :repository_id => "MyString",
      :sha => "MyString",
      :author_name => "MyString",
      :author_email => "MyString"
    ).as_new_record)
  end

  it "renders new commit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", commits_path, "post" do
      assert_select "input#commit_committer_email[name=?]", "commit[committer_email]"
      assert_select "input#commit_committer_name[name=?]", "commit[committer_name]"
      assert_select "input#commit_html_url[name=?]", "commit[html_url]"
      assert_select "input#commit_repository_id[name=?]", "commit[repository_id]"
      assert_select "input#commit_sha[name=?]", "commit[sha]"
      assert_select "input#commit_author_name[name=?]", "commit[author_name]"
      assert_select "input#commit_author_email[name=?]", "commit[author_email]"
    end
  end
end
