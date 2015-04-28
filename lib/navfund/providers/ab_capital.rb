# AB Capital

module Navfund
  class ABCapital < Provider
    # List of funds
    MAIN_URL = "http://www.uitf.com.ph/daily_navpu.php?bank_id=29"
    Funds = [
      {:name => "AB CAPITAL SHORT-TERM FUND", :currency => "PHP", :ticker => ""}, 
      {:name => "AB CAPITAL PREMIUM FUND", :currency => "PHP", :ticker => ""},
      {:name => "AB CAPITAL BALANCED FUND", :currency => "PHP", :ticker => ""},
      {:name => "AB CAPITAL EQUITY FUND", :currency => "PHP", :ticker => "ABCAPEQ:PM"}
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
