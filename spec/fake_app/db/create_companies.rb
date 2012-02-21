class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |u|
      u.string :cnpj
    end
  end

  def self.down
    drop_table :companies
  end
end