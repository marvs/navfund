# Sun Life Financial

module Navfund
  class Sunlife < Provider
    # List of funds
    MAIN_URL = "http://www.sunlife.com.ph/philippines/Products+and+Services/Sun+Life+Prosperity+Funds?vgnLocale=en_CA"
    VUL_URL = "http://www.sunlife.com.ph/philippines/Products+and+Services/VUL?vgnLocale=en_CA"
    Funds = ["Bond Fund", "Balanced Fund", "Equity Fund", "Money Market Fund", "GS Fund", "Dollar Advantage Fund", "Dollar Abundance Fund"]
   
    def initialize
      @url = MAIN_URL
      @vul_url = VUL_URL
      self.scrape
    end 
    
    # Fetch the current value
    # Some providers have a separate page for VUL funds, to force checking the VUL page,
    # set the type to :vul, for example @sunlife.value("Bond Fund", :vul)
    # It is possible that the same fund name is used for VUL and non-VUL funds so this is necessary
    def value(fund, fund_type=nil)
      val = nil
      # Set fund_type to nil if VUL page is not present
      fund_type = nil if fund_type == :vul && @wrapped_vul_document.nil?
      if valid_fund?(fund)
        source_document = (fund_type == :vul) ? @wrapped_vul_document : @wrapped_document
        fname = source_document.search("[text()*='#{fund}']").first
        if fname
          fval = fname.parent.next_element rescue nil
        elsif @wrapped_vul_document && fund_type != :vul
          # Search VUL page (if its not done before)
          fname = @wrapped_vul_document.search("[text()*='#{fund}']").first
          fval = fname.parent.next_element rescue nil
        end
        val = Provider.strip_value(fval.text) if fval
      else
        raise InvalidFund
      end
      val
    end
    
    def valid_fund?(fund)
      Funds.include?(fund)
    end
    
    def funds
      Funds
    end
  end
end
