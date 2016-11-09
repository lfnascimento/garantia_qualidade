FactoryGirl.define do
  factory :aplicacao do
    projeto
    checklist
    prazo { 1.week.from_now }
  end
end
