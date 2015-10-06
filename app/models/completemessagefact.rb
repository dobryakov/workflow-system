class Completemessagefact < Messagefact

  belongs_to :message, counter_cache: :is_completed

  validates_numericality_of :out_id,       greater_than: 0
  validates_numericality_of :message_id,   greater_than: 0
  #validates_numericality_of :workpoint_id, greater_than: 0

  before_validation do

    errors.add(:filter, "You can not pass message through out without current workpoint") if !self.out.workpoint
    errors.add(:filter, "You can not pass message through out without next workpoint")    if !self.out.next_workpoint

    out.filters.each{ |filter|
      result = filter.do(message)
      errors.add(:filter, "Filter #{filter.id} can not pass message") if !result
    }

    errors.add(:message, "Message #{self.message.id} already completed") if self.message.completed?

  end

  after_save do

    out            = self.out
    user           = self.user
    message        = self.message

    if message && out && out.workpoint && out.next_workpoint

      # set user

      message.sender     = user if user

      # set out

      message.sender_out = out

      # set sender workpoint

      message.sender_workpoint    = out.workpoint

      # set next workpoint

      message.recipient_workpoint = out.next_workpoint

      #save

      message.save

      # call assign method on next workpoint
      message.recipient_workpoint.assign_message(message)

    end

  end

end
