# Provider class, where all banks/providers inherit

module Navfund
  class Provider
    
    def scrape
      @document = open(@url).read
      @wrapped_document = Nokogiri::HTML(@document)
      if @vul_url
        @vul_document = open(@vul_url).read
        @wrapped_vul_document = Nokogiri::HTML(@vul_document)
      end
    end
    
    def self.strip_value(val)
      val.strip.gsub('PHP', '').gsub('USD', '').strip
    end
    
    def valid_fund?(fund)
      false
    end
    
  end
end
