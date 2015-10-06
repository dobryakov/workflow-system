class Attach < ActiveRecord::Base

  belongs_to :message
  belongs_to :attachable, polymorphic: true

end
