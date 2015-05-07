require 'nokogiri'
require 'open-uri'
require 'openssl'
require 'date'

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
require "navfund/providers/ab_capital"
require "navfund/providers/asia_united_bank"
require "navfund/providers/atram"
require "navfund/providers/bank_of_commerce"
require "navfund/providers/bdo_unibank"
require "navfund/providers/bpi"
require "navfund/providers/china_bank_savings"
require "navfund/providers/china_banking_corporation"
require "navfund/providers/ctbc_bank"
require "navfund/providers/development_bank_philippines"
require "navfund/providers/metrobank"
require "navfund/providers/philamlife"
require "navfund/providers/philippine_national_bank"
require "navfund/providers/security_bank"
require "navfund/providers/sunlife"
require "navfund/providers/ucpb"
require "navfund/providers/union_bank"


module Navfund
  Providers = [ABCapital, AsiaUnitedBank, ATRAM, BankOfCommerce, BDO, BPI, ChinaBankSavings, ChinaBank, CTBCBank, DevelopmentBankPh, Metrobank, Philamlife, PNB, SecurityBank, Sunlife, UCPB, UnionBank]
end
