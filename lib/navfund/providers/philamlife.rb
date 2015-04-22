# Philam Life

module Navfund
  class Philamlife < Provider
    MAIN_URL = "https://portal.philamlife.com/NAVPU/philamlife"
    Funds = [
      {:name => "PAMI PHILAM BOND FUND", :currency => "PHP", :ticker => "PHILABF:PM"}, 
      {:name => "PAMI PHILAM FUND", :currency => "PHP", :ticker => "PHILAMF:PM"},
      {:name => "PAMI PHILAM STRATEGIC GROWTH FUND", :currency => "PHP", :ticker => "PHILSTG:PM"},
      {:name => "PESO FIXED INCOME FUND", :currency => "PHP", :ticker => ""},
      {:name => "PESO EQUITY FUND", :currency => "PHP", :ticker => ""},
      {:name => "PESO BALANCED FUND", :currency => "PHP", :ticker => ""},
      {:name => "DOLLAR BOND FUND", :currency => "USD", :ticker => ""},
      {:name => "DOLLAR GLOBAL BOND FUND", :currency => "USD", :ticker => ""},
      {:name => "DOLLAR HIGH-WATER MARK FUND 2019", :currency => "USD", :ticker => ""},
      {:name => "PRINCIPAL PROTECT FUND 1", :currency => "PHP", :ticker => ""},
      {:name => "PRINCIPAL PROTECT FUND 2", :currency => "PHP", :ticker => ""},
      {:name => "PRINCIPAL PROTECT EMERGING MARKETS FUND", :currency => "PHP", :ticker => ""},
      {:name => "ASIA'S BEST FUND 1", :currency => "PHP", :ticker => ""},
      {:name => "ASIA'S BEST FUND 2", :currency => "PHP", :ticker => ""},
      {:name => "GROWTH INVEST FUND 1", :currency => "PHP", :ticker => ""},
      {:name => "GROWTH INVEST FUND 2", :currency => "PHP", :ticker => ""},
      {:name => "GROWTH INVEST FUND 3", :currency => "PHP", :ticker => ""}
      ]
      
    def initialize
      @funds = Funds
      @url = MAIN_URL
      self.scrape(:check_ssl => false)
    end 
    
    # Fetch the current value
    def value(fund, fund_type=nil)
      val = nil
      if valid_fund?(fund)
        fname = find_fund_node(@wrapped_document, fund)
        fval = fname.parent.next_element rescue nil
        val = Provider.strip_value(fval.text) if fval
      else
        raise InvalidFund
      end
      val
    end
    
    def value_at
      dcontainer = @wrapped_document.search('div#detailcol3').first
      dtext = dcontainer.text.strip
      Date.strptime(dtext, "%m/%d/%Y")
    end
    
    def find_fund_node(doc, fund)
      fname = nil
      if fund.match(/'/)
        # Fund name contains apostrophe, iterate nodeset and compare text instead
        tfund = fund.split('\'').last
        doc.search("[text()*='#{tfund}']").each do |tn|
          fname = tn if tn.text == fund
        end
      else
        fname = doc.search("[text()*='#{fund}']").first
      end
      fname
    end
    
  end
end
