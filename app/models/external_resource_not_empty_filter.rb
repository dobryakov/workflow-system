class ExternalResourceNotEmptyFilter < Filter

  def check(document)
    p document.get_attribute(check_property)
    document.get_attribute(check_property).to_s != ''
  end

end