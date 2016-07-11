class NaoConformidadeMailer < ApplicationMailer
    #default from: 'luisnascimento@id.uff.br'

    def alertar_responsavel_email(user, nc)
      @user = user
      @nc = nc
      mail(to: @user.email, subject: 'Alerta de Não Conformidade') do |format|
        format.html { render layout: 'mailer' }
      end
    end
end
