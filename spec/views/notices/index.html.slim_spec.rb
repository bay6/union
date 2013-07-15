require 'spec_helper'

describe "notices/index" do
  before(:each) do
    assign(:notices, [
      stub_model(Notice,
        :title => "Title",
        :content => "MyText",
        :user => nil
      ),
      stub_model(Notice,
        :title => "Title",
        :content => "MyText",
        :user => nil
      )
    ])
  end

  it "renders a list of notices" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
