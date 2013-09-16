# Metrobank

module Navfund
  class Metrobank < Provider
    # List of funds
    MAIN_URL = "http://www.metrobank.com.ph/trust_product.asp"
    Funds = [
      {:name => "Money Market Fund", :currency => "PHP", :type => "main"}, 
      {:name => "Max-3 Bond Fund", :currency => "PHP", :type => "main"},
      {:name => "Wealth Builder Fund", :currency => "PHP", :type => "main"},
      {:name => "Max-5 Bond Fund", :currency => "PHP", :type => "main"},
      {:name => "Balanced Fund", :currency => "PHP", :type => "main"},
      {:name => "Equity Fund", :currency => "PHP", :type => "main"},
      {:name => "$ Money Market Fund", :currency => "USD", :type => "main"},
      {:name => "$ Max-3 Bond Fund", :currency => "USD", :type => "main"},
      {:name => "$ Max-5 Bond Fund", :currency => "USD", :type => "main"}
      ]
   
    def initialize
      @url = MAIN_URL
      self.scrape
    end  
    
    # Fetch the current value
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
