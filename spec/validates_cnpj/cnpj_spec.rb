# frozen_string_literal: true

require 'spec_helper'

describe ValidatesCnpj::Cnpj do
  context 'with invalid option' do
    it '04.22A.284/0001-11 as number' do
      expect(ValidatesCnpj::Cnpj.new('04.22A.284/0001-11')).not_to be_valid
    end

    it '04.222-284.0001-11 as number' do
      expect(ValidatesCnpj::Cnpj.new('04.222-284.0001-11')).not_to be_valid
    end

    it '04222/284/0001-11 as number' do
      expect(ValidatesCnpj::Cnpj.new('04222/284/0001-11')).not_to be_valid
    end

    it '69103604020160 as number' do
      expect(ValidatesCnpj::Cnpj.new('69103604020160')).not_to be_valid
    end

    it '00000000000000 as number' do
      expect(ValidatesCnpj::Cnpj.new('00000000000000')).not_to be_valid
    end

    it '69.103.604/0001-61 as number' do
      expect(ValidatesCnpj::Cnpj.new('69.103.604/0001-61')).not_to be_valid
    end

    it '01618211000264 as number' do
      expect(ValidatesCnpj::Cnpj.new('01618211000264')).not_to be_valid
    end

    it '691036040001-601 as number' do
      expect(ValidatesCnpj::Cnpj.new('691036040001-601')).not_to be_valid
    end

    it '69103604000160a as number' do
      expect(ValidatesCnpj::Cnpj.new('69103604000160a')).not_to be_valid
    end

    it '69103604000160ABC as number' do
      expect(ValidatesCnpj::Cnpj.new('69103604000160ABC')).not_to be_valid
    end

    it '6910360400016000 as number' do
      expect(ValidatesCnpj::Cnpj.new('6910360400016000')).not_to be_valid
    end
  end

  context 'with valid option' do
    it 'blank number' do
      expect(ValidatesCnpj::Cnpj.new('')).to be_valid
    end

    it 'nil as number' do
      expect(ValidatesCnpj::Cnpj.new(nil)).to be_valid
    end

    it '69103604000160 as number' do
      expect(ValidatesCnpj::Cnpj.new('69103604000160')).to be_valid
    end

    it '69.103.604/0001-60 as number' do
      expect(ValidatesCnpj::Cnpj.new('69.103.604/0001-60')).to be_valid
    end

    it '01518211/000264 as number' do
      expect(ValidatesCnpj::Cnpj.new('01518211/000264')).to be_valid
    end

    it '01.5182110002-64 as number' do
      expect(ValidatesCnpj::Cnpj.new('01.5182110002-64')).to be_valid
    end

    it '00.000.000/1447-89 as number' do
      expect(ValidatesCnpj::Cnpj.new('00.000.000/1447-89')).to be_valid
    end
  end

  context 'with a valid value' do
    it 'returns it formatted' do
      expect(ValidatesCnpj::Cnpj.new('69103604000160').number).to eq('69.103.604/0001-60')
    end
  end

  context 'with an invalid value' do
    it 'returns as it was' do
      expect(ValidatesCnpj::Cnpj.new('123456').number).to eq('123456')
    end
  end
end
