require 'dry/logic'
require 'dry/logic/predicates'
require 'inflecto'

module Ravager
  module Predicates
    include Dry::Logic::Predicates

    predicate(:type?) do |type, value|
      value.kind_of?(type)
    end
  end

  module Restriction
    def self.[](rules)
      rules.map do |key, value|
        if Predicates.key?("#{key}?")
          value = Inflecto.constantize(Inflecto.camelize("ravager/equipment/#{value}")) if key == 'type'
          next Dry::Logic::Rule::Value.new(Predicates["#{key}?"].curry(value))
        end

        unless value.is_a?(Hash)
          value = Size[value] if key == 'size_category'
          next Restriction[key => { eql: value }]
        end

        sub_rule = value.map do |inner_key, inner_value|
          Restriction[inner_key => inner_value]
        end.reduce(:&)
        Dry::Logic::Rule::Key.new(sub_rule, name: key)
      end.reduce(:&)
    end
  end
end
