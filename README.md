# Navfund

Navfund is a ruby gem that fetches the values of the current NAVPU/NAVPS of several Banks/Providers of UITFs/Mutual Funds. Currently it only supports Philippine providers.

## Installation

Add this line to your application's Gemfile:

    gem 'navfund'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install navfund

## Usage

Get a list of supported Providers:

    Navfund::Providers

Get supported funds for a specific Provider:

    Navfund::Sunlife::Funds

Initialize a Provider's data:

    @sunlife = Navfund::Sunlife.new
        
Get the current NAVPU/NAVPS of a fund, by name:

    @sunlife.value("Bond Fund")
    
A Navfund::Provider::InvalidFund will be raised if the specified fund is not supported or is invalid.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
