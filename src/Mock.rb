class Mock

  attr_accessor :mocked_method, :sym_to_mock

  def self.mock(a_class)
    mocked = self.new
    mocked.mocked_method = a_class.instance_methods
    mocked
  end

  def when(symbol)
    raise NoMethodError unless mocked_method.include?symbol
    @sym_to_mock = symbol
    self
  end

  def returns(value)
    define_singleton_method @sym_to_mock do
      value
    end
  end

end