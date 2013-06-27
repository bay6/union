require 'spec_helper'

describe "participations/show" do
  before(:each) do
    @participation = assign(:participation, stub_model(Participation,
      :project => nil,
      :user => nil,
      :role => "Role"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/Role/)
  end
end
