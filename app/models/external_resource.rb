class ExternalResource < Document

  require 'open-uri'
  require 'rest_client'
  require 'json'

  #@foreign_document = {}

  def read
    data = RestClient::Resource.new self.foreign_document_url
    @foreign_document = JSON.parse(data.get)
  end

  def create
    @foreign_document.delete('id')
    @foreign_document.delete('created_at')
    @foreign_document.delete('updated_at')
    j = RestClient.post self.foreign_collection_url, { :order => @foreign_document }
    @foreign_document = JSON.parse(j)
    self.foreign_id = self.get_attribute('id')
    self.save
  end

  def update
    j = RestClient.put self.foreign_document_url, { :order => @foreign_document }
    @foreign_document = JSON.parse(j)
  end

  def get_attribute(attribute)
    @foreign_document ||= self.read
    @foreign_document[attribute]
  end

  def set_attribute(attribute, value = nil)
    @foreign_document ||= self.read
    @foreign_document[attribute] = value
    @foreign_document[attribute]
  end

  def clone_self
    new_resource = self.dup
    new_resource.read
    new_resource.create
    new_resource.save
    new_resource
  end

  def foreign_document
    @foreign_document ||= self.read
  end

  def foreign_collection_url(method = 'json')
    case method
      when 'json'
        self.base_url + '.json' if method == 'json'
      when 'html'
        self.base_url           if method == 'html'
      else
        nil
    end
  end

  def foreign_document_url(method = 'json')
    case method
      when 'json'
        self.base_url + '/' + self.foreign_id.to_s + '.json'
      when 'html'
        self.base_url + '/' + self.foreign_id.to_s
      else
        nil
    end
  end

end
