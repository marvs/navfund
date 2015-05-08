# Eastwest Bank

module Navfund
  class EastWestBank < Provider
    # List of funds
    MAIN_URL = "http://www.uitf.com.ph/daily_navpu.php?bank_id=8"
    Funds = [
      {:name => "Infinity Peso Money Market Fund", :currency => "PHP", :ticker => "EASPMON:PM"},
      {:name => "Infinity Peso Intermediate Term Bond Fund", :currency => "PHP", :ticker => ""},
      {:name => "Infinity Peso Long Term Bond Fund", :currency => "PHP", :ticker => "EASLTBF:PM"},
      {:name => "EastWest PhilEquity Feeder Fund", :currency => "PHP", :ticker => ""},
      {:name => "EastWest PhilEquity Institutional Feeder Fund", :currency => "PHP", :ticker => ""},
      {:name => "Infinity Dollar Intermediate Term Bond Fund", :currency => "USD", :ticker => ""}
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
