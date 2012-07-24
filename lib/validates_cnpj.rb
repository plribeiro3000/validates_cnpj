require "validates_cnpj/cnpj"

#Rspec Matchers
require "validates_cnpj/shoulda-matchers/require_a_valid_cnpj_matcher" if defined?(::Shoulda)
require "validates_cnpj/remarkable/require_a_valid_cnpj_matcher" if defined?(::Remarkable)

class CnpjValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << I18n.t("errors.messages.invalid") unless CNPJ.new(value).valid?
  end
end