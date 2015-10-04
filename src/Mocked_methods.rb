class Mocked_methods

  def mock_method(selector, arg, return_value)
    new_method = (selector.to_s + arg.to_s).to_sym
    define_singleton_method new_method do
      return_value
    end
  end

end