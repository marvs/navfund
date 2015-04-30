# ATRAM

module Navfund
  class ATRAM < Provider
    # List of funds
    MAIN_URL = "http://www.uitf.com.ph/daily_navpu.php?bank_id=31"
    Funds = [
      {:name => "ATRAM Peso Money Market Fund", :currency => "PHP", :ticker => "ATRPHMM:PM"}, 
      {:name => "ATRAM Total Return Peso Bond Fund", :currency => "PHP", :ticker => "ATRPHFI:PM"},
      {:name => "ATRAM Emerging Markets Bond Feeder Fund", :currency => "USD", :ticker => "ATREMFI:PM"},
      {:name => "ATRAM Global Total Return Bond Feeder Fund", :currency => "USD", :ticker => "ATRGLFI:PM"},
      {:name => "ATRAM Global Allocation Feeder Fund", :currency => "USD", :ticker => "ATRGLAA:PM"},
      {:name => "ATRAM Emerging Markets Equity Opportunity Feeder Fund", :currency => "USD", :ticker => "ATREMEQ:PM"},
      {:name => "ATRAM European Equity Opportunity Feeder Fund", :currency => "USD", :ticker => "ATREUEQ:PM"},
      {:name => "ATRAM Global Equity Opportunity Feeder Fund", :currency => "USD", :ticker => "ATRGLEQ:PM"},
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
