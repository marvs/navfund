# Sun Life Financial

module Navfund
  class Sunlife < Provider
    MAIN_URL = "http://www.sunlife.com.ph/philippines/Products+and+Services/Sun+Life+Prosperity+Funds?vgnLocale=en_CA"
    VUL_URL = "http://www.sunlife.com.ph/philippines/Products+and+Services/VUL?vgnLocale=en_CA"
    Funds = [
      {:name => "Bond Fund", :currency => "PHP", :type => "main", :ticker => "SNCPRBF:PM"}, 
      {:name => "Balanced Fund", :currency => "PHP", :type => "main", :ticker => "SNCPRBA:PM"},
      {:name => "Equity Fund", :currency => "PHP", :type => "main", :ticker => "SNCPPEA:PM"},
      {:name => "Money Market Fund", :currency => "PHP", :type => "main", :ticker => "SNLFMNY:PM"},
      {:name => "GS Fund", :currency => "PHP", :type => "main", :ticker => "SNLPRGS:PM"},
      {:name => "Dollar Advantage Fund", :currency => "USD", :type => "main", :ticker => "SUNPDAA:PM"},
      {:name => "Dollar Abundance Fund", :currency => "USD", :type => "main", :ticker => "SNLPRDA:PM"},
      {:name => "Money Market Fund", :currency => "PHP", :type => "vul", :ticker => nil},
      {:name => "Bond Fund", :currency => "PHP", :type => "vul", :ticker => nil},
      {:name => "Balanced Fund", :currency => "PHP", :type => "vul", :ticker => nil},
      {:name => "Equity Fund", :currency => "PHP", :type => "vul", :ticker => nil},
      {:name => "MyFuture 2020 Fund", :currency => "PHP", :type => "vul", :ticker => nil},
      {:name => "MyFuture 2025 Fund", :currency => "PHP", :type => "vul", :ticker => nil},
      {:name => "MyFuture 2030 Fund", :currency => "PHP", :type => "vul", :ticker => nil},
      {:name => "MyFuture 2035 Fund", :currency => "PHP", :type => "vul", :ticker => nil},
      {:name => "MyFuture 2040 Fund", :currency => "PHP", :type => "vul", :ticker => nil},
      {:name => "Income Fund", :currency => "PHP", :type => "vul", :ticker => nil},
      {:name => "Opportunity Fund", :currency => "PHP", :type => "vul", :ticker => nil},
      {:name => "Growth Fund", :currency => "PHP", :type => "vul", :ticker => nil},
      {:name => "Dollar Bond Fund", :currency => "USD", :type => "vul", :ticker => nil},
      {:name => "Global Income Fund", :currency => "USD", :type => "vul", :ticker => nil},
      {:name => "Sun Prestige Capital++ Fund", :currency => "USD", :type => "vul", :ticker => nil},
      {:name => "Sun Dollar Maximizer Fund", :currency => "USD", :type => "vul", :ticker => nil},
      {:name => "Sun Dollar Maximizer - UCG Fund", :currency => "USD", :type => "vul", :ticker => nil},
      {:name => "Sun Dollar Maximizer - UCG 2 Fund", :currency => "USD", :type => "vul", :ticker => nil},
      {:name => "Sun Dollar Maximizer - EA Fund", :currency => "USD", :type => "vul", :ticker => nil},
      {:name => "Sun Dollar Maximizer - EA 2 Fund", :currency => "USD", :type => "vul", :ticker => nil}
      ]
   
    def initialize
      @funds = Funds
      @url = MAIN_URL
      @vul_document = open(VUL_URL).read
      @wrapped_vul_document = Nokogiri::HTML(@vul_document)
      self.scrape
    end 
    
    # Fetch the current value
    # Some providers have a separate page for VUL funds, to force checking the VUL page,
    # set the type to :vul, for example @sunlife.value("Bond Fund", :vul)
    # It is possible that the same fund name is used for VUL and non-VUL funds so this is necessary
    def value(fund, fund_type=nil)
      val = nil
      fund_type = fund_type.to_sym if fund_type.is_a?(String)
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
    
    def value_at
      dcontainer = @wrapped_document.search("div.newsHeadlineTitle[align='left']").first
      dtext = dcontainer.text
      dstr = dtext.split("As of").last.strip
      Date.strptime(dstr, "%m/%d/%Y")
    end
    
  end
end
