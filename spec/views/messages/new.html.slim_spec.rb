require 'spec_helper'

describe "messages/new" do
  before(:each) do
    assign(:message, stub_model(Message,
      :notice => nil,
      :user => nil,
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", messages_path, "post" do
      assert_select "input#message_notice[name=?]", "message[notice]"
      assert_select "input#message_user[name=?]", "message[user]"
      assert_select "input#message_status[name=?]", "message[status]"
    end
  end
end
