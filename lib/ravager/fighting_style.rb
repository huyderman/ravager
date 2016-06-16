require 'dry-types'
require 'ravager/restriction'

module Ravager
  class FightingStyle < Dry::Types::Struct
    constructor_type(:symbolized)

    attribute :name, Types::Coercible::String
    attribute :require, Types::Hash.symbolized(
        race: Types::Restriction,
        primary: Types::Restriction,
        secondary: Types::Restriction
    )
    attribute :effect, StatBlock
  end
end
