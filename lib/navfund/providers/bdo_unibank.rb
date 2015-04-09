# BDO Unibank

module Navfund
  class BDO < Provider
    # List of funds
    MAIN_URL = "http://www.uitf.com.ph/daily_navpu.php?bank_id=6"
    Funds = [
      {:name => "INSTITUTIONAL CASH RESERVE FUND", :currency => "PHP", :code => "institutional_cash_reserve"}, 
      {:name => "PESO MONEY MARKET FUND", :currency => "PHP", :code => "peso_money_market"},
      {:name => "MERIT FUND SHORT TERM PORTFOLIO", :currency => "PHP", :code => "merit_fund_short_term"},
      {:name => "GS FUND", :currency => "PHP", :code => "gs"},
      {:name => "MERIT FUND MEDIUM TERM PORTFOLIO", :currency => "PHP", :code => "merit_fund_medium"},
      {:name => "PESO BOND FUND", :currency => "PHP", :code => "peso_bond"},
      {:name => "PESO FIXED INCOME FUND", :currency => "PHP", :code => "peso_fixed_income"},
      {:name => "PESO BALANCED FUND", :currency => "PHP", :code => "peso_balanced"},
      {:name => "EQUITY FUND", :currency => "PHP", :code => "equity"},
      {:name => "FOCUSED EQUITY FUND", :currency => "PHP", :code => "focused_equity"},
      {:name => "INSTITUTIONAL EQUITY FUND", :currency => "PHP", :code => "institutional_equity"},
      {:name => "SUSTAINABLE DIVIDEND FUND", :currency => "PHP", :code => "sustainable_dividend"},
      {:name => "DOLLAR MONEY MARKET FUND", :currency => "USD", :code => "dollar_money_market"},
      {:name => "DOLLAR BOND FUND", :currency => "USD", :code => "dollar_bond"},
      {:name => "MEDIUM TERM DOLLAR BOND FUND", :currency => "USD", :code => "medium_term_dollar_bond"}
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
