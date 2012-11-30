require File.expand_path('../../../test_helper.rb', __FILE__)

describe Navfund do
  before do
    @sunlife = Navfund::Sunlife.new
    @philamlife = Navfund::Philamlife.new
  end  
  describe "when a provider is given" do
    it "should get the provider object" do
      @sunlife.wont_be_nil
      @philamlife.wont_be_nil
    end
    it "should get the current value back in the response" do
      @sunlife.fund_names.each do |fund|
        @sunlife.value(fund).wont_be_nil
      end
      @philamlife.fund_names.each do |fund|
        @philamlife.value(fund).wont_be_nil
      end
    end
    it "should get the current value back in the response when :vul is set" do
      @sunlife.value("Bond Fund", :vul).wont_be_nil
      @philamlife.value("PELAC DOLLAR BOND FUND", :vul).wont_be_nil
    end
  end
end
