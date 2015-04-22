# Union Bank

module Navfund
  class UnionBank < Provider
    # List of funds
    MAIN_URL = "http://www.uitf.com.ph/daily_navpu.php?bank_id=13"
    Funds = [
      {:name => "UnionBank Peso Short Term Fixed Income Portfolio", :currency => "PHP", :ticker => "IFDPMMP:PM"}, 
      {:name => "UnionBank Infinity Prime Fund", :currency => "PHP", :ticker => "IFDPRIM:PM"},
      {:name => "UnionBank Medium Term Fixed Income Portfolio", :currency => "PHP", :ticker => ""},
      {:name => "UnionBank Philippine Peso Fixed Income Portfolio", :currency => "PHP", :ticker => "IFDPPBP:PM"},
      {:name => "UnionBank Long Term Fixed Income Portfolio", :currency => "PHP", :ticker => "IFDLTCI:PM"},
      {:name => "UnionBank Tax Exempt Portfolio", :currency => "PHP", :ticker => ""},
      {:name => "UnionBank Peso Balanced Portfolio", :currency => "PHP", :ticker => "UNPESBA:PM"},
      {:name => "UnionBank Dividend Play Equity Fund", :currency => "PHP", :ticker => ""},
      {:name => "UnionBank Dividend Play Equity Portfolio", :currency => "PHP", :ticker => "UBPDIVP:PM"},
      {:name => "UnionBank Large Capitalization Philippine Equity Portfolio", :currency => "PHP", :ticker => "IFDLCPE:PM"},
      {:name => "UnionBank Philippine Equity Index Tracker Fund Portfolio", :currency => "PHP", :ticker => "UBPHEIT:PM"},
      {:name => "UnionBank Dollar Bond Portfolio", :currency => "USD", :ticker => "IFPHDLB:PM"}
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
