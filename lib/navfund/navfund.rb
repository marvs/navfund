# Main module
require "providers/metrobank"

module Navfund
  class InvalidProvider < StandardError; end

  PROVIDERS = ["Metrobank"]

  #def self.scrape(url)
  #  Providers.each do |scraper|
  #    return scraper.new(url) if scraper.can_scrape?(url)
  #  end
  #  raise InvalidProvider
  #end
  
end
