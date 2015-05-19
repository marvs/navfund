# Robinsons Bank

module Navfund
  class RobinsonsBank < Provider
    # List of funds
    MAIN_URL = "http://www.uitf.com.ph/daily_navpu.php?bank_id=34"
    Funds = [
      {:name => "RBank Peso Money Market Fund", :currency => "PHP", :ticker => ""},
      {:name => "RBank Balanced Fund", :currency => "PHP", :ticker => ""}
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
