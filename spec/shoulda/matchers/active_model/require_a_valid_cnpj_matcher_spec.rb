# frozen_string_literal: true

require 'spec_helper'

describe Shoulda::Matchers::ActiveModel::RequireAValidCnpjMatcher do
  let(:company) { Company.new }

  it 'accepts on cnpj' do
    expect(company).to require_a_valid_cnpj(:cnpj)
  end

  it 'accepts without a specified attribute' do
    expect(company).to require_a_valid_cnpj
  end

  it 'rejects on name' do
    expect(company).not_to require_a_valid_cnpj(:name)
  end
end
