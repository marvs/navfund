# Navfund

Navfund is a ruby gem that fetches the values of the current NAVPU/NAVPS of several Banks/Providers of UITFs/Mutual Funds. Currently it only supports Philippine providers.

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

    @sunlife = Navfund::Sunlife.new

To get a list of supported funds for a specific Provider:

    Navfund::Sunlife::Funds
    @sunlife.funds  # if a provider is initialized

Get the current NAVPU/NAVPS of a fund, by name:

    @sunlife.value("Bond Fund")
    
Some Providers have a separate page when listing VUL (Variable Unit Life Insurance) fund values. To get the VUL value by name, add a :vul option when calling the value method. It is possible that the same name is used for both VUL and non-VUL funds:

    @sunlife.value("Bond Fund", :vul)
    
A Navfund::Provider::InvalidFund will be raised if the specified fund is not supported or is invalid.

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
