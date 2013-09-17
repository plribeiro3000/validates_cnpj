# ValidatesCnpj 

[![Gem Version](https://badge.fury.io/rb/validates_cnpj.png)](http://badge.fury.io/rb/validates_cnpj) [![Build Status](https://secure.travis-ci.org/plribeiro3000/validates_cnpj.png?branch=master)](http://travis-ci.org/plribeiro3000/validates_cnpj) [![Dependency Status](https://gemnasium.com/plribeiro3000/validates_cnpj.png)](https://gemnasium.com/plribeiro3000/validates_cnpj) [![Coverage Status](https://coveralls.io/repos/plribeiro3000/validates_cnpj/badge.png?branch=master)](https://coveralls.io/r/plribeiro3000/validates_cnpj)  [![Code Climate](https://codeclimate.com/github/plribeiro3000/validates_cnpj.png)](https://codeclimate.com/github/plribeiro3000/validates_cnpj)

Validates cnpj and test it in a simple way

## Installation

Add this line to your application's Gemfile:

    gem 'validates_cnpj'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install validates_cnpj

## Usage

Just use as any other validator:

```ruby
class User < ActiveRecord::Base
    validates :cnpj, :cnpj => true
end
```

## Notes

It will load a macher to test automatically if the gem is below shoulda-matchers.

## Mantainers
[@plribeiro3000](https://github.com/plribeiro3000)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request