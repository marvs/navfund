# Philippine Savings Bank

module Navfund
  class PhilippineSavingsBank < Provider
    # List of funds
    MAIN_URL = "http://www.uitf.com.ph/daily_navpu.php?bank_id=32"
    Funds = [
      {:name => "PSBANK MONEY MARKET FUND", :currency => "PHP", :ticker => ""}
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
