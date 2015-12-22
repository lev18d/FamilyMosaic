class UMessageMailer < ActionMailer::Base
  # default from: "#{current_user.email}"
  default to: "questions@familymosaic.ca"

  def new_message(u_message, current_user)
    @u_message = u_message

    mail(:from => current_user.email,
       :subject => "Message from #{u_message.name}")
  end

end
