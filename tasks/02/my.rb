class NumberSet < Array
  include Enumerable

  def <<(number)
    super << number unless include? number
  end

  def [](filter)
    filtered_set = NumberSet.new
    each { |number| filtered_set << number if filter.matches?(number) }
    filtered_set
  end
end

class Filter
  def &(other)
    Filter.new { |number| matches?(number) and other.matches?(number) }
  end

  def |(other)
    Filter.new { |number| matches?(number) or other.matches?(number) }
  end

  def initialize(&condition)
    @condition = condition
  end

  def matches?(number)
    @condition.call(number)
  end
end

class SignFilter < Filter
  def initialize(sign)
    @sign = sign
  end

  def matches?(number)
    case @sign
      when :positive     then number >  0
      when :non_positive then number <= 0
      when :negative     then number <  0
      when :non_negative then number >= 0
    end
  end
end

class TypeFilter < Filter
  def initialize(type)
    @type = type
  end

  def matches?(number)
    case @type
      when :integer then number.is_a? Integer
      when :real    then number.is_a? Float or number.is_a? Rational
      when :complex then number.is_a? Complex
    end
  end
end
