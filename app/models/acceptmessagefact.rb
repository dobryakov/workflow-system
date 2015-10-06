class Acceptmessagefact < Messagefact

  belongs_to :message, counter_cache: :is_accepted

  attr_reader :cloned_message

  before_validation do

    errors.add(:message, "Message #{self.message.id} already accepted") if self.message.accepted?

  end

  after_save do

    @cloned_message = message.clone_self

    @cloned_message.sender_workpoint = self.workpoint || message.recipient_workpoint
    @cloned_message.sender = self.user
    @cloned_message.save

  end

end
