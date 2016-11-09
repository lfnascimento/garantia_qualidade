FactoryGirl.define do
  factory :nao_conformidade do
    descricao "O mundo não está nos conformes"
    origem "Super desconhecida"
    prazo { 1.week.from_now }
    item
    responsavel
    aplicacao
    status "aberta"
  end
end
