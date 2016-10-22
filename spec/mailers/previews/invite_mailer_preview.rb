# Preview all emails at http://localhost:3000/rails/mailers/invite_mailer
class InviteMailerPreview < ActionMailer::Preview
  def new_user_invite
    InviteMailer.new_user_invite(Invite.first, '')
  end
end
