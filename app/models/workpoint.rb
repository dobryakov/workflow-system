class Workpoint < ActiveRecord::Base

  has_many :wowolinks
  has_many :workflows, :through => :wowolinks
  validates_length_of :workflows, :maximum => 1

  has_many :outs

  has_many :workers
  has_many :users, :through => :workers

  has_many :incoming_messages, class_name: 'Message', foreign_key: 'recipient_workpoint_id'

  # TODO: switch to self.outs.each...
  has_many :outgoing_messages, class_name: 'Message', foreign_key: 'sender_workpoint_id'

  has_many :group_links, :as => :groupable
  has_many :groups, :through => :group_links

  def workflow
    self.workflows.first
  end

  def assign_message(message, user = nil)

    # если сообщение ещё не отмечено как принятое, и
    # у воркпоинта имеются юзеры (воркеры), либо передан конкретный user
    if !message.assigned? && !message.accepted? && (user || self.users)

      return Assignmessagefact.create(
          :user      => user || self.users.sample,
          :message   => message,
          :workpoint => self
      ).message

    end

  end

  def accept_message(message)

    # если сообщение ещё не отмечено ни как ассигнутое, ни как акцепнутое
    if message.assigned? && !message.accepted?

      # create "accept message fact"
      return Acceptmessagefact.create(
        :message   => message,
        :workpoint => self,
        :user      => message.recipient
      ).cloned_message

    end

  end

  def complete_message(message, out, user = nil)

    # комплитить мессадж можно только если он не ассигнованный и не акцепнутый, т.е. совсем новый

    if !message.assigned? && !message.accepted?

      return Completemessagefact.create(
          :message => message,
          :out     => out,
          :user    => user
      ).message

    end

  end

end
