require "shoulda-matchers"

module Shoulda
  module Matchers
    module ActiveModel
      def validate_as_cnpj(attr)
        ValidateAsCnpjMatcher.new(attr)
      end

      class ValidateAsCnpjMatcher < ValidationMatcher
        def initialize(attribute)
          @attribute = attribute
        end

        def description
          "validate #{@attribute} as a valid CNPJ number"
        end

        def failure_message
          "expected #{@attribute} to be validated as a valid CNPJ number"
        end

        def matches?(subject)
          super(subject)

          disallows_invalid_value and allows_valid_value and allows_nil_value
        end

        private

        def disallows_invalid_value
          disallows_value_of("123456")
        end

        def allows_valid_value
          allows_value_of("51.114.450/0001-46")
        end

        def allows_nil_value
          allows_value_of(nil)
        end
      end
    end
  end
end