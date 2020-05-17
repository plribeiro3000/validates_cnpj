# frozen_string_literal: true

require 'spec_helper'

describe CnpjValidator do
  let(:company) { Company.new }

  context 'when cnpj is invalid' do
    before do
      company.cnpj = 12_345
      allow(I18n).to receive(:t).with(:"activerecord.errors.models.company.attributes.cnpj.invalid",
                                      default: :"activerecord.errors.messages.invalid").and_return('is invalid')
    end

    it 'sets object as invalid' do
      expect(company.valid?).to eq(false)
    end

    it 'sets an error on attribute' do
      company.valid?
      expect(company.errors[:cnpj]).to eq(['is invalid'])
    end
  end

  context 'when cnpj is valid' do
    before do
      company.cnpj = '37525685000108'
    end

    it 'sets object as valid' do
      expect(company.valid?).to eq(true)
    end

    it 'does not set an error on attribute' do
      company.valid?
      expect(company.errors[:cnpj]).to eq([])
    end
  end

  it 'accepts a nil value' do
    expect(company.valid?).to eq(true)
  end
end
