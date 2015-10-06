class Assignmessagefact < Messagefact

  belongs_to :message, counter_cache: :is_assigned

  validates_numericality_of :user_id,       greater_than: 0
  validates_numericality_of :message_id,    greater_than: 0
  validates_numericality_of :workpoint_id,  greater_than: 0

  after_save do

    self.message.update({
        :recipient           => self.user,
        :recipient_workpoint => self.workpoint
    })

    UserMailer.sendnotice(self.message).deliver

  end

end
