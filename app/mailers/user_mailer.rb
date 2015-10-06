class UserMailer < ActionMailer::Base
  default from: "public@inteam.pro"
  #layout false

  def sendnotice(message)
    @message   = message
    @recipient = @message.recipient
    @workpoint = @message.recipient_workpoint
    @outs      = @workpoint.outs
    @email     = @recipient.login
    @documents = message.attaches.map{ |attach| attach.attachable }
    @subject   = "Следующая задача для вас: #{@workpoint.title}"
    mail(to: @email,
         subject: @subject)
  end

  #def controller_path
  #  'UserMailer'
  #end

end
