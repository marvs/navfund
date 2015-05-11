# Land Bank of the Philippines

module Navfund
  class LandBank < Provider
    # List of funds
    MAIN_URL = "http://www.uitf.com.ph/daily_navpu.php?bank_id=9"
    Funds = [
      {:name => "Money Market Fund", :currency => "PHP", :ticker => ""},
      {:name => "GS-FI Fund", :currency => "PHP", :ticker => "LBGSFIX:PM"},
      {:name => "Growth Fund", :currency => "PHP", :ticker => "LBGRWTH:PM"},
      {:name => "Global $ Fund", :currency => "USD", :ticker => "LBGLBDL:PM"}
      ]
    
    def initialize(main_url=nil)
      @url = main_url ||= MAIN_URL
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
