require "validates_cnpj/cnpj"

#Rspec Matchers
require "validates_cnpj/shoulda-matchers/require_a_valid_cnpj_matcher" if defined?(::Shoulda)
require "validates_cnpj/remarkable/require_a_valid_cnpj_matcher" if defined?(::Remarkable)

class CnpjValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    key = :"activerecord.errors.models.#{record.class.name.downcase}.attributes.#{attribute.to_s}.invalid"
    record.errors[attribute] << I18n.t(key, :default => :"activerecord.errors.messages.invalid") unless CNPJ.new(value).valid?
  end
end