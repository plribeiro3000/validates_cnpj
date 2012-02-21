require 'spec_helper'
require 'remarkable/active_record'

describe Remarkable::ActiveRecord::Matchers::ValidateAsCnpjMatcher do
  context "on a attribute which validates cnpj" do
    it "should require a valid CNPJ" do
      @company = Company.new(:cnpj => '123456')
      @company.should validate_as_cnpj(:cnpj)
    end

    it "should allow a nil value" do
      @company = Company.new(:cnpj => nil)
      @company.should validate_as_cnpj(:cnpj)
    end
  end

  context "on a attribute which not validates cnpj" do
    before do
      @user = Admin.new(:cnpj => '123456')
    end

    it "should not require a valid CPF" do
      @user.should_not validate_as_cnpj(:cnpj)
    end
  end
end