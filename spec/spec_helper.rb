require "rubygems"
require "rspec"
require "active_record"

Dir.glob(File.dirname(__FILE__) + "/../lib/**/*.rb").each { |file| require file }
Dir.glob(File.dirname(__FILE__) + "/fake_app/**/*.rb").each { |file| require file }

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

CreateCompanies.migrate(:up)
CreateAdmins.migrate(:up)
