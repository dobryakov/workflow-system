class Messagefact < ActiveRecord::Base

  #belongs_to :message
  belongs_to :out
  belongs_to :workpoint
  belongs_to :user

  def as_json(options={})
    super(options.merge({:methods => :type}))
  end

end
