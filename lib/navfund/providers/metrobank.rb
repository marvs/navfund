# Metrobank

module Navfund
  class Metrobank < Provider
    # List of funds
    MAIN_URL = "http://www.uitf.com.ph/daily_navpu.php?bank_id=1"
    Funds = [
      {:name => "Money Market Fund", :currency => "PHP", :ticker => "MBSTART:PM"}, 
      {:name => "Max-3 Bond Fund", :currency => "PHP", :ticker => "MBELITE:PM"},
      {:name => "Wealth Builder Fund", :currency => "PHP", :ticker => "MBIPLUS:PM"},
      {:name => "Max-5 Bond Fund", :currency => "PHP", :ticker => "MBPKEAR:PM"},
      {:name => "Balanced Fund", :currency => "PHP", :ticker => "MBCAPGR:PM"},
      {:name => "Equity Fund", :currency => "PHP", :ticker => "MBEQITY:PM"},
      {:name => "High Dividend Yield Fund", :currency => "PHP", :ticker => ""},
      {:name => "PSEi Tracker Fund", :currency => "PHP", :ticker => ""},
      {:name => "$ Money Market Fund", :currency => "USD", :ticker => "MBDMMKF:PM"},
      {:name => "$ Max-3 Bond Fund", :currency => "USD", :ticker => "MBPHLIQ:PM"},
      {:name => "$ Max-5 Bond Fund", :currency => "USD", :ticker => "MBPHLBD:PM"}
      ]
    
    def initialize
      @url = MAIN_URL
      @funds = Funds
      scrape
    end
    
    # Fetch the current value
    def value(fund, fund_type=nil)
      uitf_com_ph_parser(fund)
    end
    
    def value_at
      uitf_com_ph_date_parser
    end
    
  end
end
