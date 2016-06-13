json.array!(@nao_conformidades) do |nao_conformidade|
  json.extract! nao_conformidade, :id, :descricao, :origem, :prazo, :checklist_id, :item_id
  json.url nao_conformidade_url(nao_conformidade, format: :json)
end
