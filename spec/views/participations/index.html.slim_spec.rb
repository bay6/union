require 'spec_helper'

describe "participations/index" do
  before(:each) do
    assign(:participations, [
      stub_model(Participation,
        :project => nil,
        :user => nil,
        :role => "Role"
      ),
      stub_model(Participation,
        :project => nil,
        :user => nil,
        :role => "Role"
      )
    ])
  end

  it "renders a list of participations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Role".to_s, :count => 2
  end
end
