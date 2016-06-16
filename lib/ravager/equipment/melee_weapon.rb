require 'dry-types'
require 'ravager/types'

module Ravager
  module Equipment
    class MeleeWeapon < Dry::Types::Struct
      attribute :name, Types::Coercible::String
      attribute :str, Types::Coercible::Int
      attribute :damage, Types::Coercible::String
      attribute :shield_damage, Types::Coercible::String
      attribute :speed, Types::Coercible::Int
      attribute :jab, Types::Nil | Types::Coercible::Int
      attribute :size_category, Types::Size
      attribute :reach, Types::Form::Float
    end
  end
end
