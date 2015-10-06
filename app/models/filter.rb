class Filter < ActiveRecord::Base

  has_and_belongs_to_many :outs

  def do(message)

    result = true

    message.attaches.each{ |attache|
      document = attache.attachable
      result = self.check(document)
      if !result
        break
      end
    }

    result

  end

  def check(document)
    # you need to implement this method in child classes
    false
  end

  def as_json(options={})
    super(options.merge({:methods => :type}))
  end

end