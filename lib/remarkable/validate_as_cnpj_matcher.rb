require 'remarkable/active_record'

module Remarkable
  module ActiveRecord
    module Matchers
      class ValidateAsCnpjMatcher < Remarkable::ActiveRecord::Base
        arguments :cnpj

        collection_assertions :cnpj_valid?, :allow_nil?, :formatted_number?

        protected

        def cnpj_valid?
          @subject.cnpj = '123456'
          @subject.valid?.errors[:cnpj].should == ['is invalid']
        end

        def allow_nil?
          @subject.cnpj = nil
          @subject.valid?.errors[:cnpj].should == []
        end

        def formatted_number?
          @subject.cnpj = '51114450000146'
          @subject.valid?.cnpj.should == '51.114.450/0001-46'
        end
      end

      def validate_as_cnpj(*args, &block)
        ValidateAsCnpjMatcher.new(*args, &block).spec(self)
      end
    end
  end
end