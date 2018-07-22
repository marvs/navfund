# Sun Life Financial

module Navfund
  class Sunlife < Provider
    MAIN_URL = "https://www.sunlife.com.ph/PH/Investments/NAVPS?vgnLocale=en_CA"
    Funds = [
      {:name => "Bond Fund", :currency => "PHP", :ticker => "SNCPRBF:PM"}, 
      {:name => "Balanced Fund", :currency => "PHP", :ticker => "SNCPRBA:PM"},
      {:name => "Equity Fund", :currency => "PHP", :ticker => "SNCPPEA:PM"},
      {:name => "Money Market Fund", :currency => "PHP", :ticker => "SNLFMNY:PM"},
      {:name => "GS Fund", :currency => "PHP", :ticker => "SNLPRGS:PM"},
      {:name => "Dynamic Fund", :currency => "PHP", :ticker => "SLPVU22:PM"},
      {:name => "Index Fund", :currency => "PHP", :ticker => "SLFPSIF:PM"},
      {:name => "Dollar Advantage Fund", :currency => "USD", :ticker => "SUNPDAA:PM"},
      {:name => "Dollar Abundance Fund", :currency => "USD", :ticker => "SNLPRDA:PM"},
      {:name => "Dollar Wellspring Fund", :currency => "USD", :ticker => "SLDWELL:PM"},
      {:name => "World Voyager Fund", :currency => "USD", :ticker => "SLWVOYA:PM"},
      {:name => "Dollar Starter Fund", :currency => "USD", :ticker => "SLDSTAR:PM"}
      ]
   
    def initialize(main_url=nil)
      @url = main_url ||= MAIN_URL
      @funds = Funds
      self.scrape
    end 
    
    # Fetch the current value
    def value(fund, fund_type=nil)
      val = nil
      if valid_fund?(fund)
        fval = fund_table.search("[text()*='#{fund}']").first.next_element.children.last.text rescue nil
        val = fval.scan(/\d./).join('').to_f if fval
      else
        raise InvalidFund
      end
      val
    end
    
    def value_at
      dtext = fund_table.search("[text()*='As of']").first.text
      dstr = dtext.split("As of").last.strip
      Date.strptime(dstr, "%m/%d/%Y")
    end

    private

    def fund_table
      @fund_table ||= @wrapped_document.xpath('//div[@id="PesoFunds"]').first
    end
    
  end
end
