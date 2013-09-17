class CnpjValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, :invalid, options) unless ValidatesCnpj::Cnpj.new(value).valid?
  end
end
