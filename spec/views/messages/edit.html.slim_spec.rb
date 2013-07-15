require 'spec_helper'

describe "messages/edit" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :notice => nil,
      :user => nil,
      :status => "MyString"
    ))
  end

  it "renders the edit message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", message_path(@message), "post" do
      assert_select "input#message_notice[name=?]", "message[notice]"
      assert_select "input#message_user[name=?]", "message[user]"
      assert_select "input#message_status[name=?]", "message[status]"
    end
  end
end
