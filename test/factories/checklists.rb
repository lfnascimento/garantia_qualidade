FactoryGirl.define do

   factory :item do
      descricao "Execucao da reuniao XX"
      produto true
      processo false
      ordem 1
      checklist
    end
  
   factory :checklist do
    identificacao "CKI565"
    fase "Inicial"
  
    factory :checklist_com_items do
      transient do
        items_count 5
      end
    
#      after(:create) do |checklist, evaluator|
#        create_list(:item, evaluator.items_count, checklist: checklist)
#      end
    end
  end
end
