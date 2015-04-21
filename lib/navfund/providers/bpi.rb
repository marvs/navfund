# Bank of the Philippine Islands

module Navfund
  class BPI < Provider
    # List of funds
    MAIN_URL = "http://www.uitf.com.ph/daily_navpu.php?bank_id=3"
    Funds = [
      {:name => "BPI Money Market Fund", :currency => "PHP", :ticker => "BPINSTI:PM"},
      {:name => "BPI Short Term Fund", :currency => "PHP", :ticker => "BPSTUIT:PM"},
      {:name => "Odyssey Peso Cash Management Fund", :currency => "PHP", :ticker => "INGPCSH:PM"},
      {:name => "BPI Premium Bond Fund", :currency => "PHP", :ticker => "BPIPRUI:PM"},
      {:name => "Odyssey Peso Income Fund", :currency => "PHP", :ticker => "INGPINC:PM"},
      {:name => "ABF Philippines Bond Index Fund", :currency => "PHP", :ticker => "ABFPH:PM"},
      {:name => "Odyssey Peso Bond Fund", :currency => "PHP", :ticker => "INGPFIN:PM"},
      {:name => "Odyssey Tax-Exempt Peso Fixed Income Fund", :currency => "PHP", :ticker => "INGTEFI:PM"},
      {:name => "BPI Balanced Fund", :currency => "PHP", :ticker => "BPIEQBL:PM"},
      {:name => "Odyssey Diversified Balanced Fund", :currency => "PHP", :ticker => "INGDVBA:PM"},
      {:name => "Odyssey Diversified Capital Fund", :currency => "PHP", :ticker => "INGDVCP:PM"},
      {:name => "BPI Equity Value Fund", :currency => "PHP", :ticker => "BPIEQUI:PM"},
      {:name => "BPI Philippine Equity Index Fund", :currency => "PHP", :ticker => "BPIPEIF:PM"},
      {:name => "BPI Philippine High Dividend Equity Fund", :currency => "PHP", :ticker => "BPPHDEF:PM"},
      {:name => "Odyssey High Conviction Equity Fund", :currency => "PHP", :ticker => "INGPHCE:PM"},
      {:name => "Odyssey Philippine Equity Fund", :currency => "PHP", :ticker => "INGPHEQ:PM"},
      {:name => "Odyssey Tax-Exempt Philippine Equity Fund", :currency => "PHP", :ticker => "INGTEPE:PM"},
      {:name => "BPI Global Bond Fund-of-Funds", :currency => "USD", :ticker => "BPIINFP:PM"},
      {:name => "BPI Global Philippine Fund", :currency => "USD", :ticker => "BPIGLPH:PM"},
      {:name => "Odyssey Emerging Market Bond Fund", :currency => "USD", :ticker => "INGUSIN:PM"},
      {:name => "Odyssey Philippine Dollar Bond Fund", :currency => "USD", :ticker => "INGPDFI:PM"},
      {:name => "Philippine Dollar Bond Index Fund", :currency => "USD", :ticker => "BPIDBIX:PM"},
      {:name => "BPI European Equity Index Feeder Fund", :currency => "USD", :ticker => "BPIEUFF:PM"},
      {:name => "BPI Global Equity Fund-of-Funds", :currency => "USD", :ticker => "BPIGLBL:PM"},
      {:name => "BPI US Equity Index Feeder Fund", :currency => "USD", :ticker => "BPIUSFF:PM"},
      {:name => "Odyssey Asia Pacific High Dividend Equity Fund", :currency => "USD", :ticker => "INGAPHD:PM"}
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
