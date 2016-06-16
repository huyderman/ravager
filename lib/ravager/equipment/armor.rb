require 'dry-types'
require 'ravager/types'

module Ravager
  module Equipment
    class Armor < Dry::Types::Struct
      attribute :name, Types::Coercible::String
      attribute :dr, Types::Coercible::Int
      attribute :defense, Types::Coercible::Int
      attribute :initiative, Types::Coercible::Int
      attribute :speed, Types::Coercible::Int
      attribute :movement, Types::Form::Float
      attribute :type, Types::Coercible::String
    end
  end
end
