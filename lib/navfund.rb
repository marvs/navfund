require 'nokogiri'
require 'open-uri'

# Add current directory to load paths
main_dir = File.dirname(__FILE__)
$:.unshift(main_dir) unless $:.include?(main_dir)

# Utilities
require "navfund/utils/require_relative"

# Main files
require "navfund/version"
require "navfund/navfund"
require "navfund/exceptions"
require "navfund/provider"

# Providers
require "navfund/providers/metrobank"
require "navfund/providers/sunlife"
require "navfund/providers/philamlife"
require "navfund/providers/bdo_unibank"
require "navfund/providers/bpi"
require "navfund/providers/philippine_national_bank"
require "navfund/providers/security_bank"

module Navfund
  Providers = [Metrobank, Sunlife, Philamlife, BDO, BPI, PNB, SecurityBank]
end
