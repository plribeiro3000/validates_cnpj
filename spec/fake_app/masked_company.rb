# frozen_string_literal: true

class MaskedCompany
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :cnpj, :name

  validates :cnpj, cnpj: { mask: true }

  def initialize(attributes = {})
    attributes.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end
end
