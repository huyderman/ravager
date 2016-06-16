require 'dry-types'
require 'ravager/types'

module Ravager
  class StatBlock < Dry::Types::Struct
    constructor_type(:symbolized)

    attribute :name, Types::Coercible::String
    attribute :initiative, Types::Coercible::Int
    attribute :speed, Types::Coercible::Int
    attribute :attack, Types::Coercible::Int
    attribute :defense, Types::Coercible::Int
    attribute :damage, Types::Coercible::String
    attribute :dr, Types::Coercible::Int
    attribute :size_category, Types::Coercible::String
    attribute :reach, Types::Coercible::Int
    attribute :movement, Types::Form::Float
    attribute :hp, Types::Coercible::String
    attribute :top_save, Types::Nil | Types::Coercible::Int
    attribute :tenacity, Types::Coercible::String
    attribute :epv, Types::Coercible::Int
  end
end
