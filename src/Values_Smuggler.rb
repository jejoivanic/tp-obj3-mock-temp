class Values_Smuggler

  attr_accessor :selector, :arg, :mocked_methods

  def initialize(mocked_methods)
    self.mocked_methods = mocked_methods
  end

  def with(arg)
    self.arg = arg
    self
  end

  def returns(value)
    mocked_methods.mock_method(selector, arg, value)
  end

end