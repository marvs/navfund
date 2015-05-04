require File.expand_path('../../../test_helper.rb', __FILE__)

describe Navfund do
  #@providers = Navfund::Providers
  @providers = [Navfund::Metrobank, Navfund::Sunlife, Navfund::Philamlife]
  @providers.each do |provider_klass|
    before do
      google_cache_url = "http://webcache.googleusercontent.com/search?q=cache:"
      test_url = "#{google_cache_url}#{provider_klass::MAIN_URL}"
      @provider = provider_klass.new(test_url)
    end
    describe "for the #{provider_klass.to_s} provider" do
      it "should get the #{provider_klass.to_s} object" do
        @provider.wont_be_nil
      end
      it "should get the current values of #{provider_klass.to_s}" do
        @provider.funds.each do |fund|
          @provider.value(fund[:name]).wont_be_empty
        end
      end
      it "should get the value date of #{provider_klass.to_s}" do
        assert @provider.value_at.is_a?(Date)
      end
    end
  end
end
