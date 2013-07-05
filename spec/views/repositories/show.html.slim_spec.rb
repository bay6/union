require 'spec_helper'

describe "repositories/show" do
  before(:each) do
    @repository = assign(:repository, stub_model(Repository,
      :avatar_url => "Avatar Url",
      :description => "Description",
      :html_url => "Html Url",
      :name => "Name",
      :starred_url => "Starred Url",
      :uid => "Uid"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Avatar Url/)
    rendered.should match(/Description/)
    rendered.should match(/Html Url/)
    rendered.should match(/Name/)
    rendered.should match(/Starred Url/)
    rendered.should match(/Uid/)
  end
end
