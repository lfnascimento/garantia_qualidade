class InviteMailer < ApplicationMailer

  def new_user_invite(invite, path) #send the invite data to our mailer to deliver the email
    @invite = invite
    @link_registro = path
    mail(to: @invite.email, subject: 'Convite Sistema Axurance') do |format|
      format.html { render layout: 'nao_conformidade_mailer' }
    end
  end

end
