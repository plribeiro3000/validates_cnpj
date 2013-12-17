require 'shoulda-matchers'
require 'active_support/core_ext/array/wrap'

module Shoulda
  module Matchers
    module ActiveModel
      def require_a_valid_cnpj(attr = :cnpj)
        RequireAValidCnpjMatcher.new(attr)
      end

      class RequireAValidCnpjMatcher < ValidationMatcher
        def description
          'require a valid CNPJ number'
        end

        def matches?(subject)
          @subject = subject
          disallows_value_of('123456') && allows_value_of('51.114.450/0001-46')
        end
      end
    end
  end
end