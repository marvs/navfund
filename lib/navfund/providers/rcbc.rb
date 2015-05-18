# Rizal Commercial Banking Corporation

module Navfund
  class RCBC < Provider
    # List of funds
    MAIN_URL = "http://www.uitf.com.ph/daily_navpu.php?bank_id=11"
    Funds = [
      {:name => "RIZAL PESO CASH MANAGEMENT FUND", :currency => "PHP", :ticker => ""},
      {:name => "RIZAL PESO MONEY MARKET", :currency => "PHP", :ticker => ""},
      {:name => "RIZAL PESO BOND FUND", :currency => "PHP", :ticker => ""},
      {:name => "RIZAL BALANCED FUND", :currency => "PHP", :ticker => ""},
      {:name => "RIZAL EQUITY FUND", :currency => "PHP", :ticker => ""},
      {:name => "RIZAL DOLLAR MONEY MARKET", :currency => "USD", :ticker => ""},
      {:name => "RIZAL DOLLAR  BOND FUND", :currency => "USD", :ticker => ""},
      {:name => "RIZAL GLOBAL EQUITY FEEDER FUND", :currency => "USD", :ticker => ""}
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
