# Sterling Bank of Asia

module Navfund
  class SterlingBank < Provider
    # List of funds
    MAIN_URL = "http://www.uitf.com.ph/daily_navpu.php?bank_id=33"
    Funds = [
      {:name => "Sterling Money Market Fund", :currency => "PHP", :ticker => ""},
      {:name => "Sterling Balanced Fund", :currency => "PHP", :ticker => ""},
      {:name => "Sterling $ Money Market Fund", :currency => "USD", :ticker => ""}
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
