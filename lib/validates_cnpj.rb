# frozen_string_literal: true

require 'validates_cnpj/cnpj_validator'
require 'validates_cnpj/require_a_valid_cnpj_matcher' if defined?(::Shoulda)

module ValidatesCnpj
  autoload :Cnpj, 'validates_cnpj/cnpj'
end
