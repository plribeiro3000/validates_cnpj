# frozen_string_literal: true

module ValidatesCnpj
  class Cnpj
    def initialize(number)
      number =~ %r{^(\d{2}\.?\d{3}\.?\d{3}/?\d{4})-?(\d{2})$}
      @number = number
      @pure_number = Regexp.last_match(1)
      @result = Regexp.last_match(2)
      @cleaned_number = @pure_number.nil? ? nil : @number.gsub(%r{[\./-]}, '')
      format_number! if @pure_number
    end

    def valid?
      return true if @number.blank?
      return false unless @pure_number

      check_cnpj
    end

    attr_reader :number

    private

    def check_cnpj
      return false if (@cleaned_number.length != 14) || (@cleaned_number.scan(/\d/).uniq.length == 1)

      @result == first_digit_verifier + second_digit_verifier
    end

    def first_digit_verifier
      sum = multiply_and_sum([5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2], @pure_number)
      digit_verifier(sum % 11).to_s
    end

    def second_digit_verifier
      sum = multiply_and_sum([6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2], @pure_number + first_digit_verifier)
      digit_verifier(sum % 11).to_s
    end

    def multiply_and_sum(array, number)
      multiplied = []
      number.scan(/\d{1}/).each_with_index { |e, i| multiplied[i] = e.to_i * array[i] }
      multiplied.inject { |s, e| s + e }
    end

    def digit_verifier(rest)
      rest < 2 ? 0 : 11 - rest
    end

    def format_number!
      @cleaned_number =~ /(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})/

      match1 = Regexp.last_match(1)
      match2 = Regexp.last_match(2)
      match3 = Regexp.last_match(3)
      match4 = Regexp.last_match(4)
      match5 = Regexp.last_match(5)

      @number = "#{match1}.#{match2}.#{match3}/#{match4}-#{match5}"
    end
  end
end
