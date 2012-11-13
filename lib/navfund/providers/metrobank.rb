# Metrobank

module Navfund
  class Metrobank < Provider
    # List of funds
    MAIN_URL = "http://www.metrobank.com.ph/trust_product.asp"
    Funds = [""]
   
    def initialize
      @url = MAIN_URL
      self.scrape
    end  
    
  end
end
