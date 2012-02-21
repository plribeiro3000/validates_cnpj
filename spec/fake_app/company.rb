class Company < ActiveRecord::Base
  validates :cnpj, :cnpj => true
end