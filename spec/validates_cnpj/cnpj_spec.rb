require 'spec_helper'

describe ValidatesCnpj::Cnpj do
  context 'should be invalid with' do
    it '04.22A.284/0001-11 as number' do
      ValidatesCnpj::Cnpj.new('04.22A.284/0001-11').should_not be_valid
    end

    it '04.222-284.0001-11 as number' do
      ValidatesCnpj::Cnpj.new('04.222-284.0001-11').should_not be_valid
    end

    it '04222/284/0001-11 as number' do
      ValidatesCnpj::Cnpj.new('04222/284/0001-11').should_not be_valid
    end

    it '69103604020160 as number' do
      ValidatesCnpj::Cnpj.new('69103604020160').should_not be_valid
    end

    it '00000000000000 as number' do
      ValidatesCnpj::Cnpj.new('00000000000000').should_not be_valid
    end

    it '69.103.604/0001-61 as number' do
      ValidatesCnpj::Cnpj.new('69.103.604/0001-61').should_not be_valid
    end

    it '01618211000264 as number' do
      ValidatesCnpj::Cnpj.new('01618211000264').should_not be_valid
    end

    it '691036040001-601 as number' do
      ValidatesCnpj::Cnpj.new('691036040001-601').should_not be_valid
    end

    it '69103604000160a as number' do
      ValidatesCnpj::Cnpj.new('69103604000160a').should_not be_valid
    end

    it '69103604000160ABC as number' do
      ValidatesCnpj::Cnpj.new('69103604000160ABC').should_not be_valid
    end

    it '6910360400016000 as number' do
      ValidatesCnpj::Cnpj.new('6910360400016000').should_not be_valid
    end
  end

  context 'should be valid with' do
    it 'blank number' do
      ValidatesCnpj::Cnpj.new('').should be_valid
    end
    
    it 'nil as number' do
      ValidatesCnpj::Cnpj.new(nil).should be_valid
    end

    it '69103604000160 as number' do
      ValidatesCnpj::Cnpj.new('69103604000160').should be_valid
    end

    it '69.103.604/0001-60 as number' do
      ValidatesCnpj::Cnpj.new('69.103.604/0001-60').should be_valid
    end

    it '01518211/000264 as number' do
      ValidatesCnpj::Cnpj.new('01518211/000264').should be_valid
    end

    it '01.5182110002-64 as number' do
      ValidatesCnpj::Cnpj.new('01.5182110002-64').should be_valid
    end

    it '00.000.000/1447-89 as number' do
      ValidatesCnpj::Cnpj.new('00.000.000/1447-89').should be_valid
    end
  end

  context 'with a valid value' do
    it 'should return it formatted' do
      ValidatesCnpj::Cnpj.new('69103604000160').number.should == '69.103.604/0001-60'
    end
  end

  context 'with an invalid value' do
    it 'should return as it was' do
      ValidatesCnpj::Cnpj.new('123456').number.should == '123456'
    end
  end
end