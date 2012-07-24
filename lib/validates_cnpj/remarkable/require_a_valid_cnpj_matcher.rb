require 'remarkable/active_model'

module Remarkable
  module ActiveModel
    module Matchers
      class RequireAValidCnpjMatcher < Remarkable::ActiveModel::Base
        arguments :cnpj

        collection_assertions :disallow_invalid_value, :allow_valid_value

        protected

        def disallow_invalid_value
          @subject.cnpj = '123456'
          @subject.valid?.errors[:cnpj].should == ['is invalid']
        end

        def allow_valid_value
          @subject.cnpj = nil
          @subject.valid?.errors[:cnpj].should == []
        end
      end

      def require_a_valid_cnpj(*args, &block)
        RequireAValidCnpjMatcher.new(*args, &block).spec(self)
      end
    end
  end
end