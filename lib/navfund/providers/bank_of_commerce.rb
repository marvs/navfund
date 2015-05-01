# Bank Of Commerce

module Navfund
  class BankOfCommerce < Provider
    # List of funds
    MAIN_URL = "http://www.uitf.com.ph/daily_navpu.php?bank_id=5"
    Funds = [
      {:name => "DIVERSITY MONEY MARKET FUND", :currency => "PHP", :ticker => ""}, 
      {:name => "DIVERSITY PESO BOND FUND", :currency => "PHP", :ticker => ""},
      {:name => "DIVERSITY DIVIDEND FOCUSED FUND", :currency => "PHP", :ticker => ""},
      {:name => "DIVERSITY DOLLAR BOND FUND", :currency => "USD", :ticker => ""}
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
