require 'inflecto'
require 'singleton'
require 'dry-types'

module Ravager
  module Size
    @mapping = %i(tiny small medium large huge gigantic enormous colossal)
                   .map { |size| [size, Inflecto.camelize(size)] }
                   .map do |size, name|
      klazz = Class.new {
        include Singleton
        include Comparable
      }
      [size, Size.const_set(name, klazz)]
    end.to_h.freeze

    singleton_class.send(:attr_reader, :mapping)

    def self.[](name)
      @mapping[name.to_sym].instance
    end

    mapping.each_with_index do |(name, klazz), index|
      klazz.send(:define_method, :to_sym, -> { name })
      klazz.send(:define_method, :to_s, -> { name.to_s })

      lt         = mapping.values.take(index).freeze
      eql        = mapping.values[index]
      gt         = mapping.values.drop(index + 1).freeze
      comperator = lambda do |other|
        case Size[other]
        when *lt
          1
        when eql
          0
        when *gt
          -1
        else
          nil
        end
      end

      klazz.send(:define_method, :<=>, comperator)
    end
  end
end
