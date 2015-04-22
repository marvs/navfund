# Philippine National Bank

module Navfund
  class PNB < Provider
    # List of funds
    MAIN_URL = "http://www.uitf.com.ph/daily_navpu.php?bank_id=2"
    Funds = [
      {:name => "DREAM BUILDER MONEY MARKET FUND", :currency => "PHP", :ticker => ""}, 
      {:name => "GLOBAL FILIPINO PESO MONEY MARKET FUND", :currency => "PHP", :ticker => "PNBPSPL:PM"},
      {:name => "INSTITUTIONAL MONEY MARKET FUND", :currency => "PHP", :ticker => ""},
      {:name => "PRIME PESO MONEY MARKET FUND", :currency => "PHP", :ticker => "PNBMHPR:PM"},
      {:name => "AUP GS FUND", :currency => "PHP", :ticker => "ALDUPGS:PM"},
      {:name => "PLUS INTERMEDIATE TERM BOND FUND", :currency => "PHP", :ticker => "PNBDRMB:PM"},
      {:name => "PRESTIGE BALANCED FUND", :currency => "PHP", :ticker => "PNBMHPT:PM"},
      {:name => "AUP EQUITY FUND", :currency => "PHP", :ticker => "ALDUPEQ:PM"},
      {:name => "ENHANCED PHIL-INDEX REFERENCE FUND", :currency => "PHP", :ticker => "PNBPHSX:PM"},
      {:name => "HIGH DIVIDEND FUND", :currency => "PHP", :ticker => "PNBHIDF:PM"},
      {:name => "GLOBAL FILIPINO DOLLAR MONEY MARKET FUND", :currency => "USD", :ticker => "PNBDLPL:PM"},
      {:name => "PRIME DOLLAR MONEY MARKET FUND", :currency => "USD", :ticker => "PNBDPRF:PM"},
      {:name => "PROFIT DOLLAR INTERMEDIATE TERM BOND FUND", :currency => "USD", :ticker => "PNBDLPR:PM"},
      {:name => "AUP DOLLAR FUND", :currency => "USD", :ticker => "ALDUPDL:PM"}
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
