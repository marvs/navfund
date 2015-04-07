# Metrobank

module Navfund
  class Metrobank < Provider
    # List of funds
    MAIN_URL = "http://www.uitf.com.ph/daily_navpu.php?bank_id=1"
    Funds = [
      {:name => "Money Market Fund", :currency => "PHP", :code => "money_market"}, 
      {:name => "Max-3 Bond Fund", :currency => "PHP", :code => "max3_bond"},
      {:name => "Wealth Builder Fund", :currency => "PHP", :code => "wealth_builder"},
      {:name => "Max-5 Bond Fund", :currency => "PHP", :code => "max5_bond"},
      {:name => "Balanced Fund", :currency => "PHP", :code => "balanced"},
      {:name => "Equity Fund", :currency => "PHP", :code => "equity"},
      {:name => "High Dividend Yield Fund", :currency => "PHP", :code => "high_dividend_yield"},
      {:name => "PSEi Tracker Fund", :currency => "PHP", :code => "psei_tracker"},
      {:name => "$ Money Market Fund", :currency => "USD", :code => "dollar_money_market"},
      {:name => "$ Max-3 Bond Fund", :currency => "USD", :code => "dollar_max3_bond"},
      {:name => "$ Max-5 Bond Fund", :currency => "USD", :code => "dollar_max5_bond"}
      ]
    
    def initialize
      @url = MAIN_URL
      @funds = Funds
      scrape
    end
    
    # Fetch the current value
    def value(fund)
      uitf_com_ph_parser(fund)
    end
    
  end
end
