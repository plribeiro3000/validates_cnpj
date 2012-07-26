require 'spec_helper'

describe CnpjValidator do
  context "when cnpj is invalid" do
    before :each do
      @company = Company.new(:cnpj => "12345")
      I18n.stub(:t).with(:"activerecord.errors.models.company.attributes.cnpj.invalid",
                         :default => :"activerecord.errors.messages.invalid").and_return("is invalid")
    end

    it "should set object as invalid" do
      @company.valid?.should be_false
    end

    it "should set an error on attribute" do
      @company.valid?
      @company.errors[:cnpj].should == ['is invalid']
    end
  end

  context "when cnpj is valid" do
    before :each do
      @company = Company.new(:cnpj => "37525685000108")
    end

    it "should set object as valid" do
      @company.valid?.should be_true
    end

    it "should not set an error on attribute" do
      @company.valid?
      @company.errors[:cnpj].should be_blank
    end
  end

  it "should accept a nil value" do
    @company = Company.new(:cnpj => nil)
    @company.valid?.should be_true
  end
end