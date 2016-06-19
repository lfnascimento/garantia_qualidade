json.array!(@projetos) do |projeto|
  json.extract! projeto, :id, :nome, :desc, :responsavel
  json.url projeto_url(projeto, format: :json)
end
