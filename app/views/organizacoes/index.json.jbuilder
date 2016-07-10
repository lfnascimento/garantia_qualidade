json.array!(@organizacoes) do |organizacao|
  json.extract! organizacao, :id, :nome, :descricao, :logo
  json.url organizacao_url(organizacao, format: :json)
end
