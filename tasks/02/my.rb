class NumberSet
  include Enumerable

  def initialize
    @set = []
  end

  def <<(element)
    @set << element unless @set.include? element
  end

  def size
    @set.size
  end

  def empty?
    @set.empty?
  end

  def each(&block)
    @set.each(&block)
  end

  def [](filter)
    result = NumberSet.new
    each { |element| result << element if filter.test(element) }
    result
  end
end

class Filter
  def &(other)
    Filter.new { |element| test(element) and other.test(element) }
  end

  def |(other)
    Filter.new { |element| test(element) or other.test(element) }
  end

  def initialize(&condition)
    @condition = condition
  end

  def test(element)
    @condition.call(element)
  end
end

class SignFilter < Filter
  def initialize(sign)
    @sign = sign
  end

  def test(element)
    case @sign
      when :positive     then element >  0
      when :non_positive then element <= 0
      when :negative     then element <  0
      when :non_negative then element >= 0
    end
  end
end

class TypeFilter < Filter
  def initialize(type)
    @type = type
  end

  def test(element)
    case @type
      when :integer then element.is_a? Integer
      when :real    then element.is_a? Float or element.is_a? Rational
      when :complex then element.is_a? Complex
    end
  end
end
