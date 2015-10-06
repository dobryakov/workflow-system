class StubFilter < Filter

  def do(message)
    # this filter always return true
    true
  end

end