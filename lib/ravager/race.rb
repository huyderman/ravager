require 'dry-types'
require 'ravager/types'

module Ravager
  class Race < Dry::Types::Struct
    attribute :name, Types::Coercible::String
    attribute :initiative, Types::Coercible::Int
    attribute :speed, Types::Coercible::Int
    attribute :attack, Types::Coercible::Int
    attribute :defense, Types::Coercible::Int
    attribute :damage, Types::Form::Int
    attribute :dr, Types::Coercible::Int
    attribute :size_category, Types::Size
    attribute :reach, Types::Coercible::Int
    attribute :movement, Types::Form::Float
    attribute :hp, Types::Coercible::String
    attribute :top_save, Types::Nil | Types::Coercible::Int
    attribute :tenacity, Types::Coercible::String
    attribute :epv, Types::Coercible::Int
  end
end
