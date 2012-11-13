# Provider class, where all banks/providers inherit

module Navfund
  class Provider
    class InvalidFund < StandardError; end
    
    def scrape
      @document = open(@url).read
      @wrapped_document = Nokogiri::HTML(@document)
    end
  end
end
