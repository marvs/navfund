# Sun Life Financial

module Navfund
  class Sunlife < Provider
    MAIN_URL = "http://www.sunlife.com.ph/philippines/Products+and+Services/Sun+Life+Prosperity+Funds?vgnLocale=en_CA"
    Funds = [
      {:name => "Bond Fund", :currency => "PHP", :ticker => "SNCPRBF:PM"}, 
      {:name => "Balanced Fund", :currency => "PHP", :ticker => "SNCPRBA:PM"},
      {:name => "Equity Fund", :currency => "PHP", :ticker => "SNCPPEA:PM"},
      {:name => "Money Market Fund", :currency => "PHP", :ticker => "SNLFMNY:PM"},
      {:name => "GS Fund", :currency => "PHP", :ticker => "SNLPRGS:PM"},
      {:name => "Dollar Advantage Fund", :currency => "USD", :ticker => "SUNPDAA:PM"},
      {:name => "Dollar Abundance Fund", :currency => "USD", :ticker => "SNLPRDA:PM"}
      ]
   
    def initialize(main_url=nil)
      @url = main_url ||= MAIN_URL
      @url = MAIN_URL
      self.scrape
    end 
    
    # Fetch the current value
    def value(fund, fund_type=nil)
      val = nil
      if valid_fund?(fund)
        fname = @wrapped_document.search("[text()*='#{fund}']").first
        fval = fname.parent.next_element rescue nil
        val = Provider.strip_value(fval.text) if fval
      else
        raise InvalidFund
      end
      val
    end
    
    def value_at
      dcontainer = @wrapped_document.search("div.newsHeadlineTitle[align='left']").first
      dtext = dcontainer.text
      dstr = dtext.split("As of").last.strip
      Date.strptime(dstr, "%m/%d/%Y")
    end
    
  end
end
