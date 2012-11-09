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

# Providers
require "navfund/providers/metrobank"

module Navfund
  # Your code goes here... or not
end
