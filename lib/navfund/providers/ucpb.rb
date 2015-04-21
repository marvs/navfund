# United Coconut Planter's Bank

module Navfund
  class UCPB < Provider
    # List of funds
    MAIN_URL = "http://www.uitf.com.ph/daily_navpu.php?bank_id=14"
    Funds = [
      {:name => "UCPB Cash Management Fund", :currency => "PHP", :ticker => "UCPBCSH:PM"},
      {:name => "UCPB Peso Bond Fund", :currency => "PHP", :ticker => "UCPBCSV:PM"},
      {:name => "UCPB Balanced Fund", :currency => "PHP", :ticker => "UCPBBAL:PM"},
      {:name => "UCPB Equity Fund", :currency => "PHP", :ticker => "UCPBEQT:PM"},
      {:name => "UCPB High Dividend Fund", :currency => "PHP", :ticker => "UCPBHDF:PM"},
      {:name => "UCPB US$ Money Market Fund", :currency => "USD", :ticker => "UCPBDMM:PM"}
      ]
    
    def initialize
      @url = MAIN_URL
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
