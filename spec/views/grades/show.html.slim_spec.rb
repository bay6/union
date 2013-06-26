require 'spec_helper'

describe "grades/show" do
  before(:each) do
    @grade = assign(:grade, stub_model(Grade,
      :name => "Name",
      :description => "MyText",
      :weights => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
  end
end
