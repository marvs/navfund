# Bank of the Philippine Islands

module Navfund
  class BPI < Provider
    # List of funds
    MAIN_URL = "http://www.uitf.com.ph/daily_navpu.php?bank_id=3"
    Funds = [
      {:name => "BPI Money Market Fund", :currency => "PHP", :code => "money_market"},
      {:name => "BPI Short Term Fund", :currency => "PHP", :code => "short_term"},
      {:name => "Odyssey Peso Cash Management Fund", :currency => "PHP", :code => "odyssey_peso_cash"},
      {:name => "BPI Premium Bond Fund", :currency => "PHP", :code => "premium_bond"},
      {:name => "Odyssey Peso Income Fund", :currency => "PHP", :code => "odyssey_peso_income"},
      {:name => "ABF Philippines Bond Index Fund", :currency => "PHP", :code => "abf_bond_index"},
      {:name => "Odyssey Peso Bond Fund", :currency => "PHP", :code => "odyssey_peso_bond"},
      {:name => "Odyssey Tax-Exempt Peso Fixed Income Fund", :currency => "PHP", :code => "odyssey_fixed_income"},
      {:name => "BPI Balanced Fund", :currency => "PHP", :code => "balanced"},
      {:name => "Odyssey Diversified Balanced Fund", :currency => "PHP", :code => "odyssey_diversified_balanced"},
      {:name => "Odyssey Diversified Capital Fund", :currency => "PHP", :code => "odyssey_diversified_capital"},
      {:name => "BPI Equity Value Fund", :currency => "PHP", :code => "equity_value"},
      {:name => "BPI Philippine Equity Index Fund", :currency => "PHP", :code => "equity_index"},
      {:name => "BPI Philippine High Dividend Equity Fund", :currency => "PHP", :code => "high_dividend_equity"},
      {:name => "Odyssey High Conviction Equity Fund", :currency => "PHP", :code => "high_conviction_equity"},
      {:name => "Odyssey Philippine Equity Fund", :currency => "PHP", :code => "equity"},
      {:name => "Odyssey Tax-Exempt Philippine Equity Fund", :currency => "PHP", :code => "tax_exempt_equity"},
      {:name => "BPI Global Bond Fund-of-Funds", :currency => "USD", :code => "global_bond_fund_of_funds"},
      {:name => "BPI Global Philippine Fund", :currency => "USD", :code => "global_philippine"},
      {:name => "Odyssey Emerging Market Bond Fund", :currency => "USD", :code => "odyssey_emerging_market_bond"},
      {:name => "Odyssey Philippine Dollar Bond Fund", :currency => "USD", :code => "odyssey_philippine_dollar_bond"},
      {:name => "Philippine Dollar Bond Index Fund", :currency => "USD", :code => "philippine_dollar_bond_index"},
      {:name => "BPI European Equity Index Feeder Fund", :currency => "USD", :code => "european_equity_index_feeder"},
      {:name => "BPI Global Equity Fund-of-Funds", :currency => "USD", :code => "global_equity_fund_of_funds"},
      {:name => "BPI US Equity Index Feeder Fund", :currency => "USD", :code => "us_equity_index_feeder"},
      {:name => "Odyssey Asia Pacific High Dividend Equity Fund", :currency => "USD", :code => "odyssey_asia_pacific_high_dividend_equity"}
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
