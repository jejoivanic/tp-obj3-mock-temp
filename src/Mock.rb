require_relative '../src/Mocked_methods'
require_relative '../src/Values_Smuggler'

class Mock

  attr_accessor :mocked_class, :mocked_methods

  def self.mock(a_class)
    mocked = self.new
    mocked.mocked_class = a_class
    mocked.mocked_methods = Mocked_methods.new
    mocked
  end

  def when(selector)
    raise NoMethodError unless mocked_class.instance_methods.include?selector

    smuggler = Values_Smuggler.new(mocked_methods)
    smuggler.selector = selector
    smuggler
  end

  def with(*args)
    raise '#when method missed!'
  end

  def returns(args)
    raise '#when method missed!'
  end

  def method_missing(selector, arg = nil)
    new_selector = (selector.to_s + arg.to_s).to_sym
    mocked_methods.send (new_selector)
  end

end