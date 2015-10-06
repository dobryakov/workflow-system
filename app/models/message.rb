class Message < ActiveRecord::Base

  has_many   :attaches

  belongs_to :sender,    class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  belongs_to :sender_out,          class_name: 'Out'

  # redundantly, TODO: use self.sender_out.workpoint
  belongs_to :sender_workpoint,    class_name: 'Workpoint'

  belongs_to :recipient_workpoint, class_name: 'Workpoint'

  has_many   :messagefacts
  has_many   :acceptmessagefacts
  has_many   :completemessagefacts

  #attr_readonly :is_accepted
  #attr_readonly :is_completed

  def clone_self

    cloned_message = Message.new(
        :content   => self.content,
        :sender    => self.sender
    )

    self.attaches.each { |attach|

      old_document = attach.attachable
      new_document = old_document.clone_self
      new_attach   = Attach.create

      new_attach.attachable = new_document
      new_attach.save

      cloned_message.attaches << new_attach
      cloned_message.save

    }

    cloned_message.save
    cloned_message

  end

  def assigned?
    self.messagefacts.where(:type => Assignmessagefact).last
  end

  def accepted?
    self.messagefacts.where(:type => Acceptmessagefact).last
  end

  def completed?
    self.messagefacts.where(:type => Completemessagefact).last
  end

# try to prevent password_hash and password_salt in API answers...
# do not this! use serializable_hash in model
#  def as_json(options = {})
#    if !options[:include]
#      options[:include] = {}
#    end
#    if options[:include].class == Symbol
#      options[:include] = { options[:include] => {} }
#    end
#    if options[:include].include?(:sender)
#      options[:include] = options[:include].merge({:sender    => { :except => [:password_salt, :password_hash] }})
#    end
#    if options[:include].include?(:recipient)
#      options[:include] = options[:include].merge({:recipient => { :except => [:password_salt, :password_hash] }})
#    end
#    super(options)
#  end

end
