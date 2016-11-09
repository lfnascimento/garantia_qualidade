FactoryGirl.define do
  factory :user, aliases: [:responsavel] do
    nome "Luís Nascimento"
    email "luisnascimento@mail.com"
    organizacao
    admin false
    avaliado true
    password "123456"
    password_confirmation "123456"
    confirmed_at Time.now
  end
end
