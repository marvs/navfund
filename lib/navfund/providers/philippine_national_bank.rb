# Philippine National Bank

module Navfund
  class PNB < Provider
    # List of funds
    MAIN_URL = "http://www.uitf.com.ph/daily_navpu.php?bank_id=2"
    Funds = [
      {:name => "DREAM BUILDER MONEY MARKET FUND", :currency => "PHP", :code => "dream_builder_money_market"}, 
      {:name => "GLOBAL FILIPINO PESO MONEY MARKET FUND", :currency => "PHP", :code => "global_peso_money_market"},
      {:name => "INSTITUTIONAL MONEY MARKET FUND", :currency => "PHP", :code => "institutional_money_market"},
      {:name => "PRIME PESO MONEY MARKET FUND", :currency => "PHP", :code => "prime_peso_money_market"},
      {:name => "AUP GS FUND", :currency => "PHP", :code => "aup_gs"},
      {:name => "PLUS INTERMEDIATE TERM BOND FUND", :currency => "PHP", :code => "plus_intermediate_term_bond"},
      {:name => "PRESTIGE BALANCED FUND", :currency => "PHP", :code => "prestige_balanced"},
      {:name => "AUP EQUITY FUND", :currency => "PHP", :code => "aup_equity"},
      {:name => "ENHANCED PHIL-INDEX REFERENCE FUND", :currency => "PHP", :code => "enhanced_index_reference"},
      {:name => "HIGH DIVIDEND FUND", :currency => "PHP", :code => "high_dividend"},
      {:name => "GLOBAL FILIPINO DOLLAR MONEY MARKET FUND", :currency => "USD", :code => "global_filipino_dollar_money_market"},
      {:name => "PRIME DOLLAR MONEY MARKET FUND", :currency => "USD", :code => "prime_dollar_money_market"},
      {:name => "PROFIT DOLLAR INTERMEDIATE TERM BOND FUND", :currency => "USD", :code => "profit_dollar_intermediate_term_bond"},
      {:name => "AUP DOLLAR FUND", :currency => "USD", :code => "aup_dollar"}
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
    
  end
end
