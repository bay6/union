require 'spec_helper'

describe "commits/show" do
  before(:each) do
    @commit = assign(:commit, stub_model(Commit,
      :committer_email => "Committer Email",
      :committer_name => "Committer Name",
      :html_url => "Html Url",
      :repository_id => "Repository",
      :sha => "Sha",
      :author_name => "Author Name",
      :author_email => "Author Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Committer Email/)
    rendered.should match(/Committer Name/)
    rendered.should match(/Html Url/)
    rendered.should match(/Repository/)
    rendered.should match(/Sha/)
    rendered.should match(/Author Name/)
    rendered.should match(/Author Email/)
  end
end
