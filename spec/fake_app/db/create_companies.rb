class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |c|
      c.string :cnpj
      c.string :name
    end
  end

  def self.down
    drop_table :companies
  end
end