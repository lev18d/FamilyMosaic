class MessageMailer < ActionMailer::Base
  default from: "questions@familymosaic.ca"
  default to: "questions@familymosaic.ca"
  def new_message(message)
    @message = message
    
    mail subject: "Message from #{message.name}"
  end
end
