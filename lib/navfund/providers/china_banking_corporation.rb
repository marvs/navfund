# China Banking Corporation

module Navfund
  class ChinaBank < Provider
    # List of funds
    MAIN_URL = "http://www.uitf.com.ph/daily_navpu.php?bank_id=7"
    Funds = [
      {:name => "CBC MONEY MARKET FUND", :currency => "PHP", :ticker => ""}, 
      {:name => "CBC SHORT-TERM FUND", :currency => "PHP", :ticker => ""},
      {:name => "CBC INTERMEDIATE FIXED-INCOME FUND", :currency => "PHP", :ticker => ""},
      {:name => "CBC GS FUND", :currency => "PHP", :ticker => ""},
      {:name => "CBC BALANCED FUND", :currency => "PHP", :ticker => ""},
      {:name => "CBC EQUITY FUND", :currency => "PHP", :ticker => ""},
      {:name => "CBC DOLLAR FUND", :currency => "USD", :ticker => ""}
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
