# frozen_string_literal: true

require 'rspec'
require 'active_model'
require 'coveralls'
require 'jazz_fingers'
require 'shoulda-matchers'

JazzFingers.configure do |config|
  config.colored_prompt = false
  config.awesome_print = false
  config.coolline = false
  config.application_name = ValidatesCnpj
end

require 'jazz_fingers/setup'

RSpec.configure do |config|
  config.include Shoulda::Matchers::ActiveModel
end

Coveralls.wear!

require File.expand_path('lib/validates_cnpj')
require File.expand_path('spec/fake_app/company')
