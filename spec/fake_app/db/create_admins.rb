class CreateAdmins < ActiveRecord::Migration
  def self.up
    create_table :admins do |u|
      u.string :cnpj
    end
  end

  def self.down
    drop_table :admins
  end
end