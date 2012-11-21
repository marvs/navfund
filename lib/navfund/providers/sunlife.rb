# Sun Life Financial

module Navfund
  class Sunlife < Provider
    MAIN_URL = "http://www.sunlife.com.ph/philippines/Products+and+Services/Sun+Life+Prosperity+Funds?vgnLocale=en_CA"
    VUL_URL = "http://www.sunlife.com.ph/philippines/Products+and+Services/VUL?vgnLocale=en_CA"
    Funds = [
      {:name => "Bond Fund", :currency => "PHP"}, 
      {:name => "Balanced Fund", :currency => "PHP"},
      {:name => "Equity Fund", :currency => "PHP"},
      {:name => "Money Market Fund", :currency => "PHP"},
      {:name => "GS Fund", :currency => "PHP"},
      {:name => "Dollar Advantage Fund", :currency => "USD"},
      {:name => "Dollar Abundance Fund", :currency => "USD"},
      {:name => "Money Market Fund", :currency => "PHP"},
      {:name => "MyFuture 2020 Fund", :currency => "PHP"},
      {:name => "MyFuture 2025 Fund", :currency => "PHP"},
      {:name => "MyFuture 2030 Fund", :currency => "PHP"},
      {:name => "MyFuture 2035 Fund", :currency => "PHP"},
      {:name => "MyFuture 2040 Fund", :currency => "PHP"},
      {:name => "Income Fund", :currency => "PHP"},
      {:name => "Opportunity Fund", :currency => "PHP"},
      {:name => "Growth Fund", :currency => "PHP"},
      {:name => "Dollar Bond Fund", :currency => "USD"},
      {:name => "Sun Prestige Capital++ Fund", :currency => "USD"},
      {:name => "Sun Dollar Maximizer Fund", :currency => "USD"},
      {:name => "Sun Dollar Maximizer - UCG Fund", :currency => "USD"},
      {:name => "Sun Dollar Maximizer - UCG 2 Fund", :currency => "USD"}
      ]
   
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
    
    # List supported funds
    def funds
      Funds
    end
    
    # List supported funds by name
    def fund_names
      self.funds.map{ |x| x[:name] }
    end
    
    # Check if the fund name is supported
    def valid_fund?(fund)
      self.fund_names.include?(fund)
    end
  end
end
