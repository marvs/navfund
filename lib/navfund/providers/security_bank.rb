# Security Bank

module Navfund
  class SecurityBank < Provider
    # List of funds
    MAIN_URL = "http://www.uitf.com.ph/daily_navpu.php?bank_id=12"
    Funds = [
      {:name => "SB PESO MONEY MARKET FUND", :currency => "PHP", :ticker => "SBPSOEA:PM"}, 
      {:name => "SB Intermediate Term Peso Bond Fund", :currency => "PHP", :ticker => "SBITPBD:PM"},
      {:name => "SB PESO BOND FUND", :currency => "PHP", :ticker => "SBPSUIT:PM"},
      {:name => "SB TAX-EXEMPT BOND FUND", :currency => "PHP", :ticker => "SBTEXBD:PM"},
      {:name => "SB PESO ASSET VARIETY FUND", :currency => "PHP", :ticker => "SBPSASV:PM"},
      {:name => "SB HIGH DIVIDEND PESO EQUITY FUND", :currency => "PHP", :ticker => "SBPSHDF:PM"},
      {:name => "SB PESO EQUITY FUND", :currency => "PHP", :ticker => "SBPSEQF:PM"},
      {:name => "SB DOLLAR BOND FUND", :currency => "USD", :ticker => "SBDLUIT:PM"}
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
