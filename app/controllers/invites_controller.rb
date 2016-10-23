class InvitesController < ApplicationController

  def create
    @invite = Invite.new(invite_params)
    @invite.sender_id = current_user.id

    respond_to do |format|
      if @invite.save
        InviteMailer.new_user_invite(@invite, new_user_registration_url(invite_token: @invite.token)).
          deliver #send the invite data to our mailer to deliver the email
          format.html { redirect_to edit_organizacao_path(params[:invite][:organizacao_id]), notice: 'Email enviado com sucesso.' }
      else
        format.html { redirect_to edit_organizacao_path(params[:invite][:organizacao_id]), notice: 'Problema ao enviar o email de notificação.' }
      end
    end
  end

  private

  def invite_params
    params.require(:invite).permit(:organizacao_id, :email)
  end

end
