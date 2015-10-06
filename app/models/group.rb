class Group < ActiveRecord::Base

  belongs_to :group_class
  has_many   :group_links
  has_many   :users,       :through => :group_links, :source => :groupable, :source_type => 'User'
  has_many   :workpoints,  :through => :group_links, :source => :groupable, :source_type => 'Workpoint'

end
