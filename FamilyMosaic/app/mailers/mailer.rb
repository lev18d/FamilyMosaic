class Mailer < ActionMailer::Base
  default from: "noreply@familymosaic.ca"
  

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.invite.subject
  #
  def invite(invite, profile ,signup_path)
    @invite = invite
    @signup_path = signup_path
    @profile = profile

    mail(:to => invite.recipient_email,
         :subject => 'Invitation to FamilyMosaic')
  end
end
