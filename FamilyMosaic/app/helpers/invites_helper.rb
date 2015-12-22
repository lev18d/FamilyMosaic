module InvitesHelper
    def send_invite(reciever_email, p_id)
    invite = Invite.new(recipient_email:reciever_email, profile_id: p_id)
    invite.sender = current_user
    profile = Profile.find_by_user_id(current_user)
    user= User.find_by_email(reciever_email)
    if user
      return "user already exists"
    else
      if invite.save
        Mailer.invite(invite, profile ,signup_path(invite.token)).deliver
        return true
      else
        return "invite could not be saved"
      end
    end
  end
end
