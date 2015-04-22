# BDO Unibank

module Navfund
  class BDO < Provider
    # List of funds
    MAIN_URL = "http://www.uitf.com.ph/daily_navpu.php?bank_id=6"
    Funds = [
      {:name => "INSTITUTIONAL CASH RESERVE FUND", :currency => "PHP", :ticker => "BDOICRF:PM"}, 
      {:name => "PESO MONEY MARKET FUND", :currency => "PHP", :ticker => "BDOPMMF:PM"},
      {:name => "MERIT FUND SHORT TERM PORTFOLIO", :currency => "PHP", :ticker => "EPCIBME:PM"},
      {:name => "GS FUND", :currency => "PHP", :ticker => "EPCIBGS:PM"},
      {:name => "MERIT FUND MEDIUM TERM PORTFOLIO", :currency => "PHP", :ticker => "BDOMERB:PM"},
      {:name => "PESO BOND FUND", :currency => "PHP", :ticker => "BDOPBF:PM"},
      {:name => "PESO FIXED INCOME FUND", :currency => "PHP", :ticker => "BDOPFIF:PM"},
      {:name => "PESO BALANCED FUND", :currency => "PHP", :ticker => "BDOPBAL:PM"},
      {:name => "EQUITY FUND", :currency => "PHP", :ticker => "EPCIBEQ:PM"},
      {:name => "FOCUSED EQUITY FUND", :currency => "PHP", :ticker => "BDOTFEF:PM"},
      {:name => "INSTITUTIONAL EQUITY FUND", :currency => "PHP", :ticker => "BDOEQTY:PM"},
      {:name => "SUSTAINABLE DIVIDEND FUND", :currency => "PHP", :ticker => "BDOTSDF:PM"},
      {:name => "DOLLAR MONEY MARKET FUND", :currency => "USD", :ticker => "BDODMMF:PM"},
      {:name => "DOLLAR BOND FUND", :currency => "USD", :ticker => "BDODBF:PM"},
      {:name => "MEDIUM TERM DOLLAR BOND FUND", :currency => "USD", :ticker => "EPCIBUS:PM"}
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
