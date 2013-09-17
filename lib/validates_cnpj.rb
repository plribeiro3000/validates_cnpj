require 'cnpj_validator'
require 'require_a_valid_cnpj_matcher' if defined?(::Shoulda)

module ValidatesCnpj
  autoload :Cnpj, 'validates_cnpj/cnpj'
end