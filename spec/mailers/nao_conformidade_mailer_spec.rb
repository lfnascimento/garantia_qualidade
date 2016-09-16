require "rails_helper"

RSpec.describe NaoConformidadeMailer, type: :mailer do
  
  before(:each) do
    allow_any_instance_of(NaoConformidade).to receive(:created_at).and_return("2016-01-01")
  end
  
  describe "alertar responsavel por email" do
    
    user = FactoryGirl.build(:user)
    nc =  FactoryGirl.build(:nao_conformidade)
    let(:mail) { NaoConformidadeMailer.alertar_responsavel_email(user, nc) }
    
    it 'renders the headers' do
      expect(mail.subject).to eq("Alerta de Não Conformidade")
      expect(mail.to).to eq(["luisnascimento@mail.com"])
      expect(mail.from).to eq(["from@example.com"])
    end
    
    it 'renders the body' do
      expect(mail.body.encoded).to match("<head>\r\n<link rel=\"stylesheet\" media=\"screen\" href=\"/assets/email-fcb7c12300dcf1301763951ce44bbeda93cf793c110e801e33d82ca715d84828.css\" />\r\n</head>\r\n<body class='centered-wrapper'>\r\n<div class='centered-content'>\r\n<p>\r\n<b>\r\nPrezado(a) Luís Nascimento,\r\n</b>\r\n<br>\r\n<br>\r\nVocê está recebendo uma notificação de alerta de uma\r\n<b>\r\nnão conformidade.\r\n</b>\r\n</p>\r\n<div class='nao-conformidade'>\r\n<p>\r\n<b>\r\nDescrição:\r\n</b>\r\nMyString\r\n</p>\r\n<p>\r\n<b>\r\nOrigem:\r\n</b>\r\nMyString\r\n</p>\r\n<p>\r\n<b>\r\nCriada em\r\n</b>\r\n01/01/2016\r\n</p>\r\n<p>\r\n<b>\r\nPrazo máximo de resolução\r\n</b>\r\n02/01/2016\r\n</p>\r\n</div>\r\n\r\n<footer>\r\n<b>\r\n<a href=\"#\">Axurance - Sistema de Apoio para Garantia da Qualidade</a>\r\n<img alt=\"Sistema de Apoio para Garantia da Qualidade - Axurance\" class=\"logo\" src=\"/assets/quality-badge-401e9de7edc7ad64d479d182839698d58dbfbcca78e8b4f372c145e60591bfa0.svg\" width=\"22\" height=\"22\" />\r\n</b>\r\n</footer>\r\n</div>\r\n</body>\r\n")
    end
  end

end
