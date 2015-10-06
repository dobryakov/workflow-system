class Job < ActiveRecord::Base

  belongs_to :job_class
  has_many   :attaches

end
