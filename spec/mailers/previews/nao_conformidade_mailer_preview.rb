# Preview all emails at http://localhost:3000/rails/mailers/nao_conformidade_mailer
class NaoConformidadeMailerPreview < ActionMailer::Preview
  def alertar_responsavel_email
    NaoConformidadeMailer.alertar_responsavel_email(User.first, NaoConformidade.last)
  end
end
