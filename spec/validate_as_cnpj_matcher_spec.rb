require 'spec_helper'
require 'shoulda-matchers'

describe Shoulda::Matchers::ActiveModel::RequireAValidCnpjMatcher do
  before :each do
    @company = Company.new
  end

  it "should accept on cnpj" do
    @company.should require_a_valid_cnpj(:cnpj)
  end

  it "should accept without a specified attribute" do
    @company.should require_a_valid_cnpj
  end

  it "should reject on name" do
    @company.should_not require_a_valid_cnpj(:name)
  end
end