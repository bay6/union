require 'spec_helper'

describe "commits/index" do
  before(:each) do
    assign(:commits, [
      stub_model(Commit,
        :committer_email => "Committer Email",
        :committer_name => "Committer Name",
        :html_url => "Html Url",
        :repository_id => "Repository",
        :sha => "Sha",
        :author_name => "Author Name",
        :author_email => "Author Email"
      ),
      stub_model(Commit,
        :committer_email => "Committer Email",
        :committer_name => "Committer Name",
        :html_url => "Html Url",
        :repository_id => "Repository",
        :sha => "Sha",
        :author_name => "Author Name",
        :author_email => "Author Email"
      )
    ])
  end

  it "renders a list of commits" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Committer Email".to_s, :count => 2
    assert_select "tr>td", :text => "Committer Name".to_s, :count => 2
    assert_select "tr>td", :text => "Html Url".to_s, :count => 2
    assert_select "tr>td", :text => "Repository".to_s, :count => 2
    assert_select "tr>td", :text => "Sha".to_s, :count => 2
    assert_select "tr>td", :text => "Author Name".to_s, :count => 2
    assert_select "tr>td", :text => "Author Email".to_s, :count => 2
  end
end
