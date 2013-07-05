require 'spec_helper'

describe "repositories/index" do
  before(:each) do
    assign(:repositories, [
      stub_model(Repository,
        :avatar_url => "Avatar Url",
        :description => "Description",
        :html_url => "Html Url",
        :name => "Name",
        :starred_url => "Starred Url",
        :uid => "Uid"
      ),
      stub_model(Repository,
        :avatar_url => "Avatar Url",
        :description => "Description",
        :html_url => "Html Url",
        :name => "Name",
        :starred_url => "Starred Url",
        :uid => "Uid"
      )
    ])
  end

  it "renders a list of repositories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Avatar Url".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Html Url".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Starred Url".to_s, :count => 2
    assert_select "tr>td", :text => "Uid".to_s, :count => 2
  end
end
