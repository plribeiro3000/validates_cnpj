# ValidatesCnpj 

[![Gem Version](https://badge.fury.io/rb/validates_cnpj.png)](http://badge.fury.io/rb/validates_cnpj) [![Build Status](https://secure.travis-ci.org/plribeiro3000/validates_cnpj.png?branch=master)](http://travis-ci.org/plribeiro3000/validates_cnpj) [![Coverage Status](https://coveralls.io/repos/plribeiro3000/validates_cnpj/badge.png?branch=master)](https://coveralls.io/r/plribeiro3000/validates_cnpj)  [![Code Climate](https://codeclimate.com/github/plribeiro3000/validates_cnpj.png)](https://codeclimate.com/github/plribeiro3000/validates_cnpj)

Validates cnpj and test it in a simple way.
Supports ruby 2.2+ and rails 3+.

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
class Company < ActiveRecord::Base
    validates :cnpj, cnpj: true
end
```

To force the attribute to be masked pass option `mask`:

```ruby
class Company < ActiveRecord::Base
  validates :cnpj, cnpj: { mask: true }
end
```

## Testing

Require the matcher:

```ruby
require 'validates_cnpj/require_a_valid_cnpj_matcher'
```

Use in your tests:

```ruby
it { is_expected.to require_a_valid_cnpj } # It will test the attribute :cnpj by default
it { is_expected.to require_a_valid_cnpj(:id) }
```

## Mantainers
[@plribeiro3000](https://github.com/plribeiro3000)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request