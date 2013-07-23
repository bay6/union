require 'spec_helper'

describe Badge do

  context "class" do
    subject { Badge }
  end

  describe "validations " do
  	it { should validate_presence_of :name_zh}
  	it { should validate_presence_of :name_en}
  	it { should validate_presence_of :description}
  end
  
end
