# Philam Life

module Navfund
  class Philamlife < Provider
    MAIN_URL = "http://www.philamlife.com/en/individuals/resources-and-guides/fund-prices/philam-life-variable-funds/philam_life_variable_funds.html"
    VUL_URL = "http://www.philamlife.com/en/individuals/resources-and-guides/fund-prices/pelac-variable-funds/pelac_variable_funds.html"
    Funds = [
      {:name => "PAMI PHILAM BOND FUND", :currency => "PHP"}, 
      {:name => "PAMI PHILAM FUND", :currency => "PHP"},
      {:name => "PAMI PHILAM STRATEGIC GROWTH FUND", :currency => "PHP"},
      {:name => "PESO FIXED INCOME FUND", :currency => "PHP"},
      {:name => "PESO EQUITY FUND", :currency => "PHP"},
      {:name => "PESO BALANCED FUND", :currency => "PHP"},
      {:name => "DOLLAR BOND FUND", :currency => "USD"},
      {:name => "DOLLAR GLOBAL BOND FUND", :currency => "USD"},
      {:name => "DOLLAR HIGH-WATER MARK FUND", :currency => "USD"},
      {:name => "PRINCIPAL PROTECT FUND 1", :currency => "PHP"},
      {:name => "PRINCIPAL PROTECT FUND 2", :currency => "PHP"},
      {:name => "PRINCIPAL PROTECT EMERGING MARKETS FUND", :currency => "PHP"},
      {:name => "ASIA'S BEST FUND 1", :currency => "PHP"},
      {:name => "ASIA'S BEST FUND 2", :currency => "PHP"},
      {:name => "GROWTH INVEST FUND 1", :currency => "PHP"},
      {:name => "GROWTH INVEST FUND 2", :currency => "PHP"},
      {:name => "GROWTH INVEST FUND 3", :currency => "PHP"},
      {:name => "PELAC PESO EQUITY FUND", :currency => "PHP"},
      {:name => "PELAC PESO BALANCED FUND", :currency => "PHP"},
      {:name => "PELAC PESO FIXED INCOME FUND", :currency => "PHP"},
      {:name => "PELAC DOLLAR BOND FUND", :currency => "USD"},
      {:name => "PELAC GLOBAL BOND FUND", :currency => "PHP"},
      {:name => "PELAC DOLLAR HIGH-WATER MARK FUND", :currency => "USD"},
      {:name => "PELAC PRINCIPAL PROTECT FUND", :currency => "PHP"},
      {:name => "PELAC PRINCIPAL PROTECT FUND", :currency => "PHP"},
      {:name => "PELAC PRINCIPAL PROTECT EMERGING MARKETS FUND", :currency => "PHP"}
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
        fname = find_fund_node(source_document, fund)
        if fname
          fval = fname.next_element.next_element rescue nil
        elsif @wrapped_vul_document && fund_type != :vul
          # Search VUL page (if its not done before)
          fname = find_fund_node(@wrapped_vul_document, fund)
          fval = fname.next_element.next_element rescue nil
        end
        val = Provider.strip_value(fval.text) if fval
      else
        raise InvalidFund
      end
      val
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
