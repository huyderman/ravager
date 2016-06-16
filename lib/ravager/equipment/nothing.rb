require 'singleton'

module Ravager
  module Equipment
    class Nothing < Dry::Types::Struct
      include Singleton

      def name
        'Nothing'
      end
    end
  end
end
