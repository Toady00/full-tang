[![Build Status](https://travis-ci.org/Toady00/full-tang.png)](https://travis-ci.org/Toady00/full-tang)
[![Dependency Status](https://gemnasium.com/Toady00/full-tang.png)](https://gemnasium.com/Toady00/full-tang)
[![Code Climate](https://codeclimate.com/github/Toady00/full-tang.png)](https://codeclimate.com/github/Toady00/full-tang)

# FullTang

This gem is in very early development. It is intended to be a Chef Server API client, that works across different Ruby interpreters (JRuby support is a requirement).

## Installation

Add this line to your application's Gemfile:

    gem 'full-tang'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install full-tang

## Usage

The intended API will look something like this:

````ruby
FullTang.setup do |config|
  config.server_url  = "https://example.com"
  config.client_key  = '~/.chef/admin.pem'
  config.client_name = 'admin'
end

client = FullTang.client
client.roles
client.role(name: "role_name")
# etc
````

As stated above, Full-Tang is still in early development and subject to drastic changes.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
