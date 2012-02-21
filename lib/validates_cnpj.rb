require "active_model"
require "validates_cnpj/cnpj"

class CnpjValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << I18n.t("errors.messages.invalid") unless CNPJ.new(value).valid?
  end
end