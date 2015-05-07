# Development Bank of the Philippines

module Navfund
  class DevelopmentBankPh < Provider
    # List of funds
    MAIN_URL = "http://www.uitf.com.ph/daily_navpu.php?bank_id=26"
    Funds = [
      {:name => "UNLAD KAWANI MONEY MARKET FUND", :currency => "PHP", :ticker => ""},
      {:name => "UNLAD PAMAHALAAN GS MONEY MARKET FUND", :currency => "PHP", :ticker => ""},
      {:name => "GINTONG SIKAP SECURE FUND", :currency => "PHP", :ticker => ""}
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
