# Asia United Bank

module Navfund
  class AsiaUnitedBank < Provider
    # List of funds
    MAIN_URL = "http://www.uitf.com.ph/daily_navpu.php?bank_id=4"
    Funds = [
      {:name => "Peso Money Market Fund", :currency => "PHP", :ticker => ""}, 
      {:name => "Peso Investment Trust Fund", :currency => "PHP", :ticker => "AUBPPIF:PM"},
      {:name => "Equity Investment Trust Fund", :currency => "PHP", :ticker => "AUBBEIF:PM"},
      {:name => "Gold Dollar Fund", :currency => "USD", :ticker => "AUBBGDF:PM"}
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
