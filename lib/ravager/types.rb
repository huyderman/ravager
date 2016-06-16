require 'dry-types'
require 'ravager/size'
require 'ravager/restriction'

module Ravager
  module Types
    include Dry::Types.module

    Size = Size.mapping
               .values.map { |klazz| Dry::Types::Definition.new(klazz).constrained(type: klazz) }
               .reduce(:|).constructor(Size.method(:[]))

    Restriction = Dry::Types::Definition.new(Dry::Logic::Rule)
                      .constructor(Ravager::Restriction.method(:[]))
                      .constrained(type: Dry::Logic::Rule)
  end
end
