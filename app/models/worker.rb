class Worker < ActiveRecord::Base

  belongs_to :workpoint
  belongs_to :user

  validates_uniqueness_of :user_id, scope: :workpoint_id

end
