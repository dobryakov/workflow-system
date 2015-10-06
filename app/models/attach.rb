class Attach < ActiveRecord::Base

  belongs_to :message
  belongs_to :attachable, polymorphic: true
  belongs_to :job

end
