# Navfund

Navfund is a ruby gem that fetches the values of the current NAVPU/NAVPS of several UITFs/Mutual Funds. Currently it only supports Philippine providers.

[![Gem Version](https://badge.fury.io/rb/navfund.svg)](http://badge.fury.io/rb/navfund)
[![Build Status](https://travis-ci.org/marvs/navfund.png)](https://travis-ci.org/marvs/navfund)


## Installation

Add this line to your application's Gemfile:

    gem 'navfund'

And then execute:

    bundle

Or install it yourself as:

    gem install navfund

## Usage

Get a list of supported Providers:

    Navfund::Providers

Initialize a Provider's data:

    @metrobank = Navfund::Metrobank.new

To get a list of supported funds for a specific Provider:

    Navfund::Metrobank::Funds
    @metrobank.funds  # if a provider is initialized

Get the current NAVPU/NAVPS of a fund, by name:

    @metrobank.value("Equity Fund")
    
A Navfund::Provider::InvalidFund will be raised if the specified fund is not supported or is invalid.

Get the date in which the value is valid. This returns a Date object:

    @metrobank.value_at

To list all fund names with their current values:

    @metrobank.fund_values
    
This returns an array of hashes with all the fund names and their current values.


## Testing

Install the minitest gem if its not already installed in your system

    gem install minitest
    
Then run the tests (default rake task is the 'test' task):

    rake test


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
