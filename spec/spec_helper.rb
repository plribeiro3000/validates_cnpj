# frozen_string_literal: true

require 'rspec'
require 'active_model'
require 'coveralls'
require 'shoulda-matchers'

RSpec.configure do |config|
  config.include Shoulda::Matchers::ActiveModel
end

Coveralls.wear!

require File.expand_path('lib/validates_cnpj')
require File.expand_path('spec/fake_app/company')
