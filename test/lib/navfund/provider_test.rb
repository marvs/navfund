require File.expand_path('../../../test_helper.rb', __FILE__)

describe Navfund do
  before do
    @sunlife = Navfund::Sunlife.new
    @metrobank = Navfund::Metrobank.new
  end  
  describe "when a provider is given" do
    it "should get the provider object" do
      @sunlife.wont_be_nil
      @metrobank.wont_be_nil
    end
    it "should get the current value back in the response" do
      @sunlife.funds.each do |fund|
        @sunlife.value(fund[:name], fund[:type]).wont_be_nil
      end
      @metrobank.funds.each do |fund|
        @metrobank.value(fund[:name], fund[:type]).wont_be_nil
      end
    end
  end
end
