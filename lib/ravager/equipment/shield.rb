require 'dry-types'
require 'ravager/types'

module Ravager
  module Equipment
    class Shield < Dry::Types::Struct
      attribute :name, Types::Coercible::String
      attribute :defense, Types::Coercible::Int
    end
  end
end
