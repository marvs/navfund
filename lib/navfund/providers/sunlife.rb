# Sun Life Financial

module Navfund
  class Sunlife < Provider
    # List of funds
    MAIN_URL = "http://www.sunlife.com.ph/philippines/Products+and+Services/Sun+Life+Prosperity+Funds?vgnLocale=en_CA"
    Funds = ["Bond Fund", "Balanced Fund", "Equity Fund", "Money Market Fund", "GS Fund", "Dollar Advantage Fund", "Dollar Abundance Fund"]
   
    def initialize
      @url = MAIN_URL
      self.scrape
    end  
    
    def value(fund)
      val = nil
      if valid_fund?(fund)
        fname = @wrapped_document.search("[text()*='#{fund}']").first
        if fname
          fval = fname.parent.next_element rescue nil
          val = fval.text.strip.gsub('PHP', '').strip if fval
        end
      else
        raise InvalidFund
      end
      val
    end
    
    def valid_fund?(fund)
      Funds.include?(fund)
    end
  end
end
