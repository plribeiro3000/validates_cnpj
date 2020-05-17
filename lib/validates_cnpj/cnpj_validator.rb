# frozen_string_literal: true

class CnpjValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    cnpj = ValidatesCnpj::Cnpj.new(value)

    if cnpj.valid?
      record.send("#{attribute}=", cnpj.number) if options[:mask]
    else
      record.errors.add(attribute, :invalid, options)
    end
  end
end
