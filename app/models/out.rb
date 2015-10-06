class Out < ActiveRecord::Base

  # Out is already a link! It is a link between workpoint, next_workpoint, and (has_many) filters.
  # Please do not create additional links between this entities.

  belongs_to :workpoint
  belongs_to :next_workpoint,
             class_name: 'Workpoint'

  has_many   :outgoing_messages,
             class_name: 'Message',
             foreign_key: 'sender_out_id'

  has_and_belongs_to_many :filters

  validates_numericality_of :workpoint_id, greater_than: 0
  #validates_numericality_of :next_workpoint_id, greater_than: 0

  def complete_url(message)
    "http://msg.dg.inteam.pro/message/#{message.id}/complete-on-out/#{self.id}"
  end

end
