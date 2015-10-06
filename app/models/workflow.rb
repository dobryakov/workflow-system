class Workflow < ActiveRecord::Base
  has_many :wowolinks
  has_many :workpoints, :through => :wowolinks
end
