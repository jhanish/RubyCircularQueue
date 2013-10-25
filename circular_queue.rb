class CircularQueue  < Array

  attr_reader :maximum_size


  def initialize(maximum_size, elements = nil)

    @maximum_size = maximum_size

    if elements
      elements.each { |e|  self << e }
    end

  end


  def << (element)

    # Use array's method if it's standard.  If we've exceeded size, shift one off.

    if self.size < @maximum_size || @maximum_size.nil?
      super
    else
      self.shift
      self.push(element)
    end

  end


  alias :push :<<
  alias :max :maximum_size


end