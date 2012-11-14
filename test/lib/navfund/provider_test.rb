require_relative '../../test_helper'

describe Navfund do
  before do
    @sunlife = Navfund::Sunlife.new
  end  
  describe "when a provider is given" do
    it "should get the provider object" do
      @sunlife.wont_be_nil
    end
    it "should get the current value back in the response" do
      Navfund::Sunlife::Funds.each do |fund|
        @sunlife.value(fund).wont_be_nil
      end
    end
    it "should get the current value back in the response when :vul is set" do
      @sunlife.value("Bond Fund", :vul).wont_be_nil
    end
  end
end
