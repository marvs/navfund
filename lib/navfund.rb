require 'nokogiri'
require 'open-uri'

main_dir = File.dirname(__FILE__)
$:.unshift(main_dir) unless $:.include?(main_dir)

require "navfund/utils/require_relative"
require "navfund/version"
require "navfund/navfund"

module Navfund
  # Your code goes here... or not
end
