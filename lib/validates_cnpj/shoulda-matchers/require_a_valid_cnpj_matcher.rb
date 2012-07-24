require "shoulda-matchers"

module Shoulda
  module Matchers
    module ActiveModel
      def require_a_valid_cnpj(attr = :cnpj)
        RequireAValidCnpjMatcher.new(attr)
      end

      class RequireAValidCnpjMatcher < ValidationMatcher
        def initialize(attribute)
          @attribute = attribute
        end

        def description
          "require a valid CNPJ number"
        end

        def matches?(subject)
          super(subject)

          disallows_invalid_value and allows_valid_value
        end

        private

        def disallows_invalid_value
          disallows_value_of("123456")
        end

        def allows_valid_value
          allows_value_of("51.114.450/0001-46")
        end
      end
    end
  end
end